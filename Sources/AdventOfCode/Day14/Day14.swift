import Foundation

func day14part1(input: (String, [String:String]), numberOfSteps: Int) -> Int {
    let polymer = input.0
    let mapping = input.1
    
    var result = polymer
    
    for _ in 0..<numberOfSteps {
        result = takePart1Step(polymer: result, mapping: mapping)
    }
    
    let counts: [Character: Int] = countChars(polymer: result)
    let values = counts.values.sorted(by: <)
   
    return values[values.count - 1] - values[0]
}

func takePart1Step(polymer: String, mapping: [String: String]) -> String {
    var result = String(zip(polymer, polymer.dropFirst()).map { "\($0.0)\(mapping["\($0.0)\($0.1)"]!)" }.flatMap{$0})
    result.append(polymer.last!)
    
    return result
}


func day14part2(input: (String, [String:String]), numberOfSteps: Int) -> Int {
    let polymer = input.0
    let mapping = input.1
    
    let pairs = splitIntoPairs(polymer: polymer)
    var pairCounts = countPairs(pairs: pairs, pairCounts: [:])
    var charCounts: [Character: Int] = countChars(polymer: polymer)
    
    for _ in 0..<numberOfSteps {
        let result = takePart2Step(mapping: mapping, pairCounts: pairCounts, charCounts: charCounts)
        pairCounts = result.0
        charCounts = result.1
    }
    
    let values = charCounts.values.sorted(by: <)
   
    return values[values.count - 1] - values[0]
}

func countPairs(pairs: [String], pairCounts: [String: Int]) -> [String: Int] {
    var result = pairCounts
    
    for pair in pairs {
        result[pair] = (pairCounts[pair] ?? 0) + 1
    }
    
    return result
}

func countChars(polymer: String) -> [Character: Int] {
    var counts: [Character: Int] = [:]
    for char in polymer {
        counts[char] = (counts[char] ?? 0) + 1
    }
    return counts
}

func takePart2Step(mapping: [String: String], pairCounts: [String: Int], charCounts: [Character: Int]) -> ([String: Int], [Character: Int]) {
    
    var resultingPairCounts: [String: Int] = [:]
    var resultingCharCounts = charCounts
    
    for pair in pairCounts.keys {
        let currentCount = pairCounts[pair] ?? 0
  
        let newChar = Character(mapping[pair]!)
        resultingCharCounts[newChar] = (resultingCharCounts[newChar] ?? 0) + currentCount
        
        let polymer = strengthenPolymer(pair: pair, char: newChar)
        let newPairs = splitIntoPairs(polymer: polymer)
        
        for newPair in newPairs {
            resultingPairCounts[newPair] = (resultingPairCounts[newPair] ?? 0) + currentCount
        }
    }
    
    return (resultingPairCounts, resultingCharCounts)
}

func strengthenPolymer(pair: String, char: Character) -> String {
    var pair = pair
    pair.insert(char, at: pair.index(after: pair.startIndex))
    return pair
}
            
func splitIntoPairs(polymer: String) -> [String] {
    zip(polymer, polymer.dropFirst()).map { String([$0.0, $0.1]) }
}

