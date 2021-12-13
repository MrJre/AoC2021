import Foundation

func parseDay13Input(from file: String) -> (PointGrid, [Fold])
{
    let lines = file.split(separator: "\n", omittingEmptySubsequences: false).map(String.init)
    
    let coordinatesAndFolds = lines.split(separator: "")
    let coordinates: [Point] = coordinatesAndFolds[0].map {
        let coordinate = $0.split(separator: ",")
        return Point(x: Int(coordinate[0])!, y: Int(coordinate[1])!)
    }
    let maxX = coordinates.reduce(0) { max($0, $1.x) }
    let maxY = coordinates.reduce(0) { max($0, $1.y) }
    
    var folds: [Fold] = []
    if coordinatesAndFolds.count > 1 {
        folds = coordinatesAndFolds[1].compactMap {
            let fold = $0.dropFirst("fold along ".count).split(separator: "=")
            switch fold[0] {
                case "x": return .horizontal(x: Int(fold[1])!)
                case "y": return .vertical(y: Int(fold[1])!)
                default: return nil
            }
        }
    }
    
    return (PointGrid(points: coordinates, width: maxX + 1, height: maxY + 1), folds)
}

enum Fold {
    case horizontal(x: Int)
    case vertical(y: Int)
}

struct PointGrid {
    
    var grid: [String]
    var width: Int
    var height: Int { (grid.count / width) }
    
    init(grid: [String], width: Int) {
        self.grid = grid
        self.width = width
    }
    
    init(points: [Point], width: Int, height: Int) {
        var grid = Array.init(repeating: dotChar, count: width * height)
        for point in points {
            grid[point.y * width + point.x] = letterChar
        }
        
        self.init(grid: grid, width: width)
    }
}

extension PointGrid: CustomStringConvertible {
    var description: String {
        var description = ""
        for y in 0..<height {
            let string = grid[y * width..<y * width + width].flatMap { $0 }
            description.append(contentsOf: string)
            description.append("\n")
        }
        return String(description.dropLast(1))
    }
}

let letterChar = String("#")
let dotChar = String(".")
