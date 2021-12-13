import Foundation

func day5Part1(input: [LineSegment]) -> Int {
    let maxX = input.reduce(0) { $1.maxX > $0 ? $1.maxX : $0 }
    let maxY = input.reduce(0) { $1.maxY > $0 ? $1.maxY : $0 }
    let grid = Grid(width: maxX, height: maxY)
    
    for segment in input {
        grid.writeSegment(segment: segment)
    }
    
    return grid.countIntersections()
}

func day5Part2(input: [LineSegment]) -> Int {
    let maxX = input.reduce(0) { $1.maxX > $0 ? $1.maxX : $0 }
    let maxY = input.reduce(0) { $1.maxY > $0 ? $1.maxY : $0 }
    let grid = Grid(width: maxX, height: maxY)
    grid.shouldWriteDiagonalSegments = true
    
    for segment in input {
        grid.writeSegment(segment: segment)
    }
    
    return grid.countIntersections()
}

struct LineSegment {
    let pointA: Point
    let pointB: Point
    
    var minX: Int { pointA.x < pointB.x ? pointA.x : pointB.x }
    var minY: Int { pointA.y < pointB.y ? pointA.y : pointB.y }
   
    var maxX: Int { pointA.x > pointB.x ? pointA.x : pointB.x }
    var maxY: Int { pointA.y > pointB.y ? pointA.y : pointB.y }
    
    func isVertical() -> Bool {
        return minX == maxX
    }
    
    func isHorizontal() -> Bool {
        return minY == maxY
    }
    
    func slope() -> Int {
        (pointB.y - pointA.y) / (pointB.x - pointA.x)
    }
}

class Grid {
    private var grid: [Int]
    private let width: Int
    private let height: Int
    
    var shouldWriteDiagonalSegments: Bool = false
    
    init(width: Int, height: Int) {
        self.width = width
        self.height = height
        self.grid = []
        
        for _ in 0..<(width + 1) * (height + 1) {
            grid.append(0)
        }
    }
    
    func writeSegment(segment: LineSegment) {
        if segment.isHorizontal() {
            writeHorizontalSegment(segment)
        } else if segment.isVertical() {
            writeVerticalSegment(segment)
        } else if shouldWriteDiagonalSegments {
            writeDiagonalSegment(segment)
        }
    }
    
    private func writeHorizontalSegment(_ segment: LineSegment) {
        for x in segment.minX...segment.maxX {
            write(x: x, y: segment.minY)
        }
    }

    private func writeVerticalSegment(_ segment: LineSegment) {
        for y in segment.minY...segment.maxY {
            write(x: segment.minX, y: y)
        }
    }

    private func writeDiagonalSegment(_ segment: LineSegment) {
        var y = segment.slope() < 0 ? segment.maxY : segment.minY
        for x in segment.minX...segment.maxX {
            write(x: x, y: y)
            y += segment.slope()
        }
    }
    
    private func write(x: Int, y: Int) {
        let count = grid[y * (width + 1) + x]
        grid[y * (width + 1) + x] = count + 1
    }
    
    func countIntersections() -> Int {
        grid.reduce(0) { return $1 > 1 ? $0 + 1 : $0 }
    }
}

extension Grid: CustomStringConvertible {
    var description: String {
        var string = ""
        for y in 0...height {
            for x in 0...width {
                string.append("\(grid[y * (width + 1) + x])\n")
            }
        }
        return string
    }
}

