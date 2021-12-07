import Foundation

func day7part1(input: [Int]) -> Int {
    let target = findMedian(for: input)
    return part1fuel(for: input, toTarget: target)
}

func part1fuel(for swarm: [Int], toTarget target: Int) -> Int {
    swarm.reduce(0) { $0 + abs($1 - target) }
}

func findMedian(for input: [Int]) -> Int {
    let sortedInput = input.sorted(by: <)
    if sortedInput.count % 2 == 1 {
        return (sortedInput[input.count / 2] + sortedInput[(input.count / 2) + 1]) / 2
    }
    return sortedInput[input.count / 2]
}

func day7part2(input: [Int]) -> Int {
    let sortedInput = input.sorted(by: <)
    var fuelCosts: [Int] = []
    for position in (0..<sortedInput[sortedInput.endIndex.advanced(by: -1)]) {
        fuelCosts.append(part2fuel(for: input, toTarget: position))
    }
    
    return fuelCosts.sorted(by: <)[0]
}

func day7part2Mean(input: [Int]) -> Int {
    let mean = input.map(Double.init).reduce(0.0, +) / Double(input.count)
    return min(part2fuel(for: input, toTarget: Int(ceil(mean))), part2fuel(for: input, toTarget: Int(floor(mean))))
}

func part2fuel(for swarm: [Int], toTarget target: Int) -> Int {
    swarm.reduce(0) { $0 + triangleNumber(for: abs($1 - target)) }
}

func triangleNumber(for target: Int) -> Int {
    (target * (target + 1)) / 2
}
