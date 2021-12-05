import Foundation

func parseDay3Input(from file: String) -> [String] {
    return file.split(separator: "\n").compactMap { String($0) }
}
