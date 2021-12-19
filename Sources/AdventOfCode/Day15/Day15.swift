import Foundation
import Collections

func day15part1(input: [PathNode]) -> Int {
    
    let startNode = input.first!
    let endNode = input.last!

    startNode.cost.value = 0
    
    let path = findPath(grid: input, start: startNode, end: endNode)
    
    return endNode.cost.value
}

func day15part2(input: [PathNode]) -> Int {
    
    let grid = inflateGrid(grid: input, multiplier: 5)
    
    let startNode = grid.first!
    let endNode = grid.last!
    
    startNode.cost.value = 0
    
    let path: [PathNode] = findPath(grid: grid, start: startNode, end: endNode)
    
    return path.reduce(0) { $0 + $1.z } - startNode.z
    
}

func inflateGrid(grid: [PathNode], multiplier: Int) -> [PathNode] {
    var resultingGrid: [PathNode] = []
    
    let width = Int(sqrt(Double(grid.count)))

    for y in 0..<width {
        let line = grid[y*width..<y*width + width]
        
        resultingGrid.append(contentsOf: line)
        
        for rep in 1..<multiplier {
            for x in 0..<width {
                let node = grid[y*width+x]
                var z = node.z + rep
                if z > 9 { z -= 9 }
                
                resultingGrid.append(PathNode(x: x + rep * width, y: y, z: z))
            }
        }
    }
    
    for rep in 1..<multiplier {
        for y in 0..<width {
            for x in 0..<width * multiplier {
                let node = resultingGrid[y * width * multiplier + x]
                var z = node.z + rep
                if z > 9 { z -= 9 }
                
                resultingGrid.append(PathNode(x: x, y: y + rep * width, z: z))
            }
        }
    }
    
    let resultingWidth = Int(sqrt(Double(resultingGrid.count)))
    return addingNeighbours(nodes: resultingGrid, width: resultingWidth, height: resultingWidth)
}


func findPath(grid: [PathNode], start: PathNode, end: PathNode) -> [PathNode] {
    
    var heap = Heap<PathNode>()
    heap.insert(start)
    
    var current = start
    while !heap.isEmpty {
        current = heap.popMin()!
        current.cost.visited = true
        
        for neighbor in current.neighbours.filter({ !$0.cost.visited }) {
            if neighbor.z + current.cost.value < neighbor.cost.value {
                neighbor.cost = Cost(value: neighbor.z + current.cost.value, previousNode: current)
                heap.insert(neighbor)
            }
        }
    }
    
    var path: [PathNode] = [end]
    var currentNode: PathNode? = end
    
    repeat {
        if let previousNode = currentNode?.cost.previousNode {
            path.append(previousNode)
        }
        
        currentNode = currentNode?.cost.previousNode
    } while currentNode != nil
    
    return path.reversed()
}

struct Cost {
    var value: Int = .max
    var previousNode: PathNode? = nil
    var visited: Bool = false
}

extension Cost: Equatable {}

extension Cost: CustomStringConvertible {
    var description: String { "\(value)" }
}

class PathNode {
    var x: Int
    var y: Int
    var z: Int

    var cost: Cost
    
    var neighbours: [PathNode] = []
    
    init(x: Int, y: Int, z: Int) {
        self.x = x
        self.y = y
        self.z = z
         
        self.cost = Cost()
    }
}

extension PathNode: CustomStringConvertible {
    var description: String { "[(\(x),\(y)):\(z)]"}
}

extension PathNode: Equatable {
    static func == (lhs: PathNode, rhs: PathNode) -> Bool {
        lhs.x == rhs.x && lhs.y == rhs.y
    }
}

extension PathNode: Comparable {
    static func < (lhs: PathNode, rhs: PathNode) -> Bool {
        lhs.cost.value < rhs.cost.value
    }
}
