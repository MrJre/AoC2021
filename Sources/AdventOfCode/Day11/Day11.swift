import Foundation

func day11part1(input: [Node], numberOfSteps: Int) -> Int {
    
    var score = 0
    
    for _ in 0..<numberOfSteps {
       score += step(input: input)
    }
    
    return score
}

func day11part2(input: [Node]) -> Int {
    
    var steps = 0
    
    while input.filter({ $0.z == 0 }).count != input.count {
        step(input: input)
        steps += 1
    }
    
    return steps
}

@discardableResult func step(input: [Node]) -> Int {

    energizeOctopussies(input)
    
    var flashes = 0

    while !input.filter({ $0.z > 9 }).isEmpty {
        for node in input.filter({ $0.z > 9 }) {
            node.neighbours.forEach { if $0.z > 0 { $0.z += 1 }}
            node.z = 0
            flashes += 1
        }
    }
    
    print(input: input)
    print("-")

    return flashes
}

func energizeOctopussies(_ octoNodes: [Node]) {
    for node in octoNodes {
        node.z += 1
    }
}

func print(input: [Node]) {
    let width = Int(sqrt(Double(input.count)))
    for y in 0..<width {
        print(input[y*width..<y*width+width].map { $0.z })
    }
}
