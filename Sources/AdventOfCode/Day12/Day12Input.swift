import Foundation

func parseDay12Input(from file: String) -> [GraphNode]
{
    let paths = file.split(separator: "\n").map(String.init)
    
    var nodes = Set<GraphNode>()
    
    for path in paths {
        var pathNodes = Set<GraphNode>()
        for node in path.split(separator: "-") {
            if let existingNode = nodes.first(where: { $0.name == node }) {
                pathNodes.insert(existingNode)
            } else {
                let node = GraphNode(name: String(node))
                nodes.insert(node)
                pathNodes.insert(node)
            }
        }
        pathNodes.forEach { pathNode in
            pathNode.neighbors.append(contentsOf: Array(pathNodes.filter { $0 != pathNode }))
        }
        
        nodes.formUnion(pathNodes)
    }
    
    return Array(nodes)
}

class GraphNode {
    var name: String
    var neighbors: [GraphNode] = []
    var isSmall: Bool { name == name.lowercased() }
    var isStart: Bool { name == "start" }
    
    init(name: String)
    {
        self.name = name
    }
}

extension GraphNode: Hashable {
    static func == (lhs: GraphNode, rhs: GraphNode) -> Bool {
        lhs.name == rhs.name
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(name)
    }
}

extension GraphNode: CustomStringConvertible {
    var description: String { name }
}
