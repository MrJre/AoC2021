import Foundation

func parseDay15Input(from file: String) -> [PathNode]
{
    let lines = file.split(separator: "\n")
    let width = lines.first!.count
    let height = lines.count
    
    let grid = lines.flatMap { $0.compactMap { Int(String($0)) }}
    
    var nodes: [PathNode] = []
    for y in 0..<height {
        for x in 0..<width {
            nodes.append(PathNode(x: x, y: y, z: grid[y * width + x]))
        }
    }
    nodes = addingNeighbours(nodes: nodes, width: width, height: height)
    
    return nodes
}


func addingNeighbours(nodes: [PathNode], width: Int, height: Int) -> [PathNode] {
    for y in 0..<height {
        for x in 0..<width {
            let node = nodes[y * width + x]
            var neighbours: [PathNode] = []
            if x - 1 >= 0 { neighbours.append(nodes[y * width + x - 1]) }
            if x + 1 < width { neighbours.append(nodes[y * width + x + 1]) }
            if y - 1 >= 0 { neighbours.append(nodes[(y - 1) * width + x]) }
            if y + 1 < height { neighbours.append(nodes[(y + 1) * width + x]) }
            node.neighbours = neighbours
        }
    }
    
    return nodes
}

