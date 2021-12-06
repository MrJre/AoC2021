import Foundation

func parseDay2Input(from file: String) -> [Movement] {
    return file.split(separator: "\n").compactMap { Movement(String($0)) }
}
