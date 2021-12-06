import Foundation

func parseDay6Input(from file: String) -> [Int]
{
    return file.split(separator: ",").compactMap { Int($0.trimmingCharacters(in: .whitespacesAndNewlines)) }
}
