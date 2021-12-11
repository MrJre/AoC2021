import Foundation

func parseDay11Input(from file: String) -> [Node]
{
    let lines = file.split(separator: "\n")
    let width = lines.first!.count
    let height = lines.count
    
    let flashLevels = lines.flatMap { $0.compactMap { Int(String($0)) }}
    var nodes: [Node] = []
    for y in 0..<height {
        for x in 0..<width {
            nodes.append(Node(x: x, y: y, z: flashLevels[y * width + x]))
        }
    }
    nodes = addingAllNeighbors(nodes: nodes, width: width, height: height)
    
    return nodes
}

func addingAllNeighbors(nodes: [Node], width: Int, height: Int) -> [Node] {
    for y in 0..<height {
        for x in 0..<width {
            let node = nodes[y * width + x]
            
            let withinLowerXBound = x - 1 >= 0
            let withinLowerYBound = y - 1 >= 0
            let withinUpperXBound = x + 1 < width
            let withinUpperYBound = y + 1 < height
            
            if withinLowerXBound { node.neighbours.append(nodes[y * width + x - 1]) }
            if withinUpperXBound { node.neighbours.append(nodes[y * width + x + 1]) }
            if withinLowerYBound { node.neighbours.append(nodes[(y - 1) * width + x]) }
            if withinUpperYBound { node.neighbours.append(nodes[(y + 1) * width + x]) }
            
            if withinLowerXBound && withinLowerYBound { node.neighbours.append(nodes[(y - 1) * width + x - 1]) }
            if withinUpperXBound && withinLowerYBound { node.neighbours.append(nodes[(y - 1) * width + x + 1]) }
            if withinLowerXBound && withinUpperYBound { node.neighbours.append(nodes[(y + 1) * width + x - 1]) }
            if withinUpperXBound && withinUpperYBound { node.neighbours.append(nodes[(y + 1) * width + x + 1]) }
        }
    }
    
    return nodes
}
