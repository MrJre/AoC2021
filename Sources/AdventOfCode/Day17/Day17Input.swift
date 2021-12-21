func parseDay17Input(from file: String) -> Box
{
    let line = file.trimmingCharacters(in: .whitespacesAndNewlines)
    let boxRanges = line.dropFirst("target area: ".count).components(separatedBy: ", ")
    
    let coordinates = boxRanges.map { $0.dropFirst(2) }.map { $0.components(separatedBy: "..") }
    
    return Box(minX: Int(coordinates[0][0])!, maxX: Int(coordinates[0][1])!, minY: Int(coordinates[1][0])!, maxY: Int(coordinates[1][1])!)
}

struct Box {
    let minX: Int
    let maxX: Int
    let minY: Int
    let maxY: Int
    
    func isInBox(point: Point) -> Bool {
        minX...maxX ~= point.x && minY...maxY ~= point.y
    }
}

extension Box: Equatable {}
