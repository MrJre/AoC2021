func parseDay16Input(from file: String) -> [String]
{
    let lines = file.split(separator: "\n").flatMap { String($0) }
    return lines.compactMap { Int(String($0), radix: 16) }.map {
        var string = String($0, radix: 2)
        string.insert(contentsOf: Array(repeating: "0", count: 4 - string.count), at: string.startIndex)
        return string
    }
}
