import Foundation

func parseDay1Input(from file: String) -> [Int] {
    return string.split(separator: "\n").map { Int($0)! }
}
