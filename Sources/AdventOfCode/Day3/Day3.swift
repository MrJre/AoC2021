import Foundation

func day3part1(input: [String]) -> Int {
    
    let gamma = getReading(input: input, bitCriteria: >)
    let epsilon = getReading(input: input, bitCriteria: <)
    
    return gamma * epsilon
}

func day3part2(input: [String]) -> Int {
    
    let oxigen = getRating(from: input, given: >=)
    let co2 = getRating(from: input, given: <)
    
    return co2 * oxigen
}


func getReading(input: [String], bitCriteria: (Int, Int) -> Bool) -> Int {
    
    let numberOfBits = input.first?.count ?? 0
    var string: String = ""
    
    for position in 0..<numberOfBits {
        let bit = getBit(from: input, at: position, given: bitCriteria)
        string.append(bit)
    }
    
    return Int(string, radix: 2)!
}


func getRating(from input: [String], given bitCriteria: (Int, Int) -> Bool) -> Int {
    
    let numberOfBits = input.first?.count ?? 0
    var filteredInput = input
    
    for position in 0..<numberOfBits {
        let bit = getBit(from: filteredInput, at: position, given: bitCriteria)
        
        let result = filteredInput.filter {
            let index = $0.index($0.startIndex, offsetBy: position)
            return $0[index] == bit
        }

        if result.isEmpty { break }
        filteredInput = result
    }

    return Int(filteredInput.first ?? "0", radix: 2)!
}

func getBit(from input: [String], at position: Int, given bitCriteria: (Int, Int) -> Bool) -> Character {
    
    let numberOfOnes = significantBitCount(from: input, at: position)
    let numberOfZeros = input.count - numberOfOnes
   
    return bitCriteria(numberOfOnes, numberOfZeros) ? "1" : "0"
}

func significantBitCount(from input: [String], at position: Int) -> Int {
    return input.reduce(0) { return isBitSignificant(in: $1, at: position) ? $0 + 1 : $0 }
}

func isBitSignificant(in line: String, at position: Int) -> Bool {
    let index = line.index(line.startIndex, offsetBy: position)
    return line[index] == "1"
}

