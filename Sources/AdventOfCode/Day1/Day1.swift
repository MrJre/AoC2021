import Foundation

func day1part1(input: [Int]) -> Int {
    var count = 0
    var previous = input.first!
    
    for depth in input {
        if depth > previous { count += 1 }
        previous = depth
    }
    
    return count
}
    
func day1part2(input: [Int]) -> Int {
    
    let windowSize = 3
    var windows: [Int] = []
    
    for index in (0...input.count - windowSize) {
        windows.append(input[index..<index + windowSize].reduce(0) { $0 + $1 })
    }
    
    return day1part1(input: windows)
}
