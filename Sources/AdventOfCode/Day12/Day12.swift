import Foundation

func day12part1(nodes: [GraphNode]) -> Int {
    guard let start = nodes.first(where: { $0.name == "start" }), let end = nodes.first(where: { $0.name == "end" }) else { return 0 }
    
    var visited: [GraphNode] = []
    
    var currentPath: [GraphNode] = []
    var allPaths: [[GraphNode]] = []

    findPath(from: start, to: end, visited: &visited, currentPath: &currentPath, allPaths: &allPaths)
    
    return allPaths.count
}

func day12part2(nodes: [GraphNode]) -> Int {
    guard let start = nodes.first(where: { $0.name == "start" }), let end = nodes.first(where: { $0.name == "end" }) else { return 0 }
    
    var visited: [GraphNode] = []
    
    var currentPath: [GraphNode] = []
    var allPaths: [[GraphNode]] = []

    findPath(from: start, to: end, visited: &visited, currentPath: &currentPath, allPaths: &allPaths, maxSmallNodeVisits: 2)
    
    return allPaths.count
}



func findPath(from nodeA: GraphNode, to nodeB: GraphNode, visited: inout [GraphNode], currentPath: inout [GraphNode], allPaths: inout [[GraphNode]], maxSmallNodeVisits: Int = 1) {
    
    let smallVisited = currentPath.filter { $0.isSmall }
    
    let hasMaxSmallNodeVisits = smallVisited.map { visitedNode in smallVisited.filter { $0 == visitedNode }.count }.contains { $0 == maxSmallNodeVisits }
    
    guard visited.filter({ $0 == nodeA && $0.isSmall }).count < (hasMaxSmallNodeVisits ? 1 : maxSmallNodeVisits) else { return }
    
    visited.append(nodeA)
    currentPath.append(nodeA)
    
    if nodeA == nodeB {
        allPaths.append(currentPath)
        visited.removeLast()
        currentPath.removeLast()
        return
    }
    
    for neighbor in nodeA.neighbors {
        if neighbor.isStart { continue }
        findPath(from: neighbor, to: nodeB, visited: &visited, currentPath: &currentPath, allPaths: &allPaths, maxSmallNodeVisits: maxSmallNodeVisits)
    }
    
    currentPath.removeLast()
    visited.removeLast()
}
