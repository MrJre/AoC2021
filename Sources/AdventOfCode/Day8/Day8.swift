import Foundation

func day8part1(input: [([Set<Edge>], [Set<Edge>])]) -> Int {
    
    let result = input.reduce(0) {
        return $0 + $1.1.reduce(0) {
            switch $1.count {
                case 2, 3, 4, 7: return $0 + 1
                default: return $0
            }
        }
    }
    
    return result
}

func day8part2(input: [([Set<Edge>], [Set<Edge>])]) -> Int {
    return input.reduce(0) { $0 + numberForEntry($1) }
}

func numberForEntry(_ entry: ([Set<Edge>], [Set<Edge>])) -> Int {
    let mapping = mapping(for: entry.0)
    return Int(entry.1.map { mapping[$0]! }.reduce("", +))!
}

func mapping(for digits: [Set<Edge>]) -> [Set<Edge>: String] {

    let one = digits.first { $0.count == 2 }!
    let seven = digits.first { $0.count == 3 }!
    let four = digits.first { $0.count == 4 }!
    let eight = digits.first { $0.count == 7 }!
    
    let twoThreeFives = digits.filter {$0.count == 5 }
    let zeroSixNines = digits.filter { $0.count == 6 }
    
    let three = twoThreeFives.first { one.isSubset(of: $0) }!
    
    let nine = zeroSixNines.first { three.isSubset(of: $0) }!
    let zero = zeroSixNines.first { one.isSubset(of: $0) && !nine.isSubset(of: $0)}!
    let six = zeroSixNines.first { $0 != nine && $0 != zero }!
    
    let five = twoThreeFives.first { $0.isSubset(of: six) }!
    let two = twoThreeFives.first { $0 != five && $0 != three }!
    
    return [zero: "0", one: "1", two: "2", three: "3", four: "4", five: "5", six: "6", seven: "7", eight: "8", nine: "9"]
}
