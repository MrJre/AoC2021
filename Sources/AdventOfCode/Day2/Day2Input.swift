import Foundation

func parseDay2Input(from: File) -> [Movement] {
    return file.split(separator: "\n").compactMap { Movement(String($0)) }
}
