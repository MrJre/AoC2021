import Foundation

func day9part1(input: [Node]) -> Int {
    input.filter { $0.isLowerThanNeighbors() }.reduce(0) { $0 + $1.z + 1 }
}

func day9part2(input: [Node]) -> Int {
    let lowestNodes = input.filter { $0.isLowerThanNeighbors() }
    let basins = findBasins(lowestNodes: lowestNodes)
    
    return basins
        .sorted { $0.count > $1.count }
        .prefix(3)
        .map { $0.count }
        .reduce(1, *)
}


func findBasins(lowestNodes: [Node]) -> [[Node]] {
    lowestNodes.map { findBasin(node: $0).union([$0]) }.map(Array.init)
}

func findBasin(node: Node) -> Set<Node> {
    node.neighbours
        .filter({ $0.z < 9 && $0.z > node.z })
        .reduce(Set<Node>()) { $0.union(findBasin(node: $1)).union([$1]) }
}


class Node {
    var x: Int
    var y: Int
    var z: Int

    var neighbours: [Node] = []
    
    init(x: Int, y: Int, z: Int) {
        self.x = x
        self.y = y
        self.z = z
    }
    
    func isLowerThanNeighbors() -> Bool {
        neighbours.reduce(true) { $0 && z < $1.z }
    }
}

extension Node: CustomStringConvertible {
    var description: String { "\(x),\(y),\(z)"}
}

extension Node: Equatable {
    static func == (lhs: Node, rhs: Node) -> Bool {
        lhs.x == rhs.x && lhs.y == rhs.y
    }
}

extension Node: Hashable {
    func hash(into hasher: inout Hasher) {
        hasher.combine(description)
    }
}
