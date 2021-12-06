import Foundation

func parseDay1Input(from file: String) -> [Int] {
    return file.split(separator: "\n").map { Int($0)! }
}
