import Foundation

func parseDay9Input(from file: String) -> [Node]
{
    let lines = file.split(separator: "\n")
    let width = lines.first!.count
    let height = lines.count
    
    let nodeHeights = lines.flatMap { $0.compactMap { Int(String($0)) }}
    var nodes: [Node] = []
    for y in 0..<height {
        for x in 0..<width {
            nodes.append(Node(x: x, y: y, z: nodeHeights[y * width + x]))
        }
    }
    nodes = addingNeighbors(nodes: nodes, width: width, height: height)
    
    return nodes
}

func addingNeighbors(nodes: [Node], width: Int, height: Int) -> [Node] {
    for y in 0..<height {
        for x in 0..<width {
            let node = nodes[y * width + x]
            if x - 1 >= 0 { node.neighbours.append(nodes[y * width + x - 1]) }
            if x + 1 < width { node.neighbours.append(nodes[y * width + x + 1]) }
            if y - 1 >= 0 { node.neighbours.append(nodes[(y - 1) * width + x]) }
            if y + 1 < height { node.neighbours.append(nodes[(y + 1) * width + x]) }
        }
    }
    
    return nodes
}

