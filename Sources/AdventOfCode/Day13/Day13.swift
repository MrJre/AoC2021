import Foundation

func day13part1(input: (PointGrid, [Fold])) -> Int {
    let grid = input.0
    let folds = input.1
    
    
    return grid.apply(fold: folds[0]).dotCount
}

func day13part2(input: (PointGrid, [Fold])) -> String {
    let grid = input.0
    let folds = input.1
    
    var result: PointGrid = grid
    
    for fold in folds {
        result = result.apply(fold: fold)
    }
    
    return result.description
}

extension PointGrid {
    func apply(fold: Fold) -> PointGrid {
        var grid = grid
        switch fold {
            case .vertical(let y):
                let range = y * width..<y * width + width
                let fold = Array(repeating: String("-"), count: range.count)
                grid.replaceSubrange(range, with: fold)
                
                let gridParts = grid.split(separator: "-").map(Array.init)
            
                return PointGrid(grid: gridParts[0], width: width).combineWith(other: PointGrid(grid: gridParts[1], width: width).flipVertically())
                
            case .horizontal(let x):
                for y in 0..<height {
                    grid[y * width + x] = "|"
                }
                
                var part1: [String] = []
                var part2: [String] = []
                
                for y in 0..<height {
                    let range = y * width..<y * width + width
                    let splitRow = grid[range].split(separator: "|")
                    part1.append(contentsOf: splitRow[0])
                    part2.append(contentsOf: splitRow[1])
                }
                
                return PointGrid(grid: part1, width: part1.count / height).combineWith(other: PointGrid(grid: part2, width: part2.count / height).flipHorizontally())
        }
    }
    
    func flipVertically() -> PointGrid {
        var result: [String] = []
        
        for y in (0..<height).reversed() {
            result.append(contentsOf: grid[y * width..<y * width + width])
        }
        
        return PointGrid(grid: result, width: width)
    }
    
    func flipHorizontally() -> PointGrid {
        var result: [String] = []
        for y in 0..<height {
            result.append(contentsOf: grid[y * width..<y * width + width].reversed())
        }
        
        return PointGrid(grid: result, width: width)
    }
    
    func combineWith(other: PointGrid) -> PointGrid {
        var result: [String] = []
        
        let offsetY = self.height - other.height
        if offsetY > 0 {
            result.append(contentsOf: grid[0 * width..<0 * width + width])
        }
        
        for y in 0..<height - offsetY {
            for x in 0..<width {
                switch (grid[(y + offsetY) * width + x], other.grid[y * width + x]) {
                    case (_, letterChar), (letterChar, _): result.append(letterChar)
                    default: result.append(dotChar)
                }
            }
        }
        
        return PointGrid(grid: result, width: width)
    }
    
    var dotCount: Int { grid.filter{ $0 == letterChar }.count }
}
