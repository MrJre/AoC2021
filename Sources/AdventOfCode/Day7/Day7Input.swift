import Foundation

func parseDay7Input(from file: String) -> [Int]
{
    return file.split(separator: ",").compactMap { Int($0.trimmingCharacters(in: .whitespacesAndNewlines)) }
}
