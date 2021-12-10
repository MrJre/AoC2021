import Foundation

func parseDay10Input(from file: String) -> [String]
{
    return file.split(separator: "\n").map(String.init)
}
