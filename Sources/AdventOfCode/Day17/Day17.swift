import Foundation

func day17part1(input: Box) -> Int {
    
    let box = input
    let start = Point(x: 0, y: 0)
    
    var validVelocities: [Point] = []
    
    for x in 1...input.maxX {
        for y in 1...max(abs(input.maxY), abs(input.minY)) {
            let velocity = Point(x: x, y: y)

            if shootWithVelocityHitsBox(velocity, from: start, given: box) {
                validVelocities.append(velocity)
            }
        }
    }
    
    print(validVelocities.sorted { $0.y > $1.y }, validVelocities.count)
    
    let velocity = validVelocities.sorted { $0.y > $1.y }[0]
    var step = Step(start: start, velocity: velocity)
    while step.velocity.y > 0 {
        step = performStep(step)
    }
    
    return step.start.y
}

func day17part2(input: Box) -> Int {
    let box = input
    let start = Point(x: 0, y: 0)
    
    var validVelocities: [Point] = []
    
    for x in 1...input.maxX {
        for y in input.minY...10000 {
            let velocity = Point(x: x, y: y)

            if shootWithVelocityHitsBox(velocity, from: start, given: box) {
                validVelocities.append(velocity)
            }
        }
    }
    return validVelocities.count
}

func shootWithVelocityHitsBox(_ velocity: Point, from start: Point, given box: Box) -> Bool {
    var onTarget = true

    var step = Step(start: start, velocity: velocity)
    
    while onTarget {
        step = performStep(Step(start: step.start, velocity: step.velocity))
        if box.isInBox(point: step.start) {
            return true
        }
        onTarget = isOnTarget(position: step.start, box: box)
    }
    
    return false
}


func performStep(_ step: Step) -> Step {
    let start = Point(x: step.start.x + step.velocity.x, y: step.start.y + step.velocity.y)
    let velocity = Point(x: max(0, step.velocity.x - 1), y: step.velocity.y - 1)
    
    return Step(start: start, velocity: velocity)
}

func isOnTarget(position: Point, box: Box) -> Bool {
    position.x <= box.maxX && position.y >= box.minY
}

struct Step {
    let start: Point
    let velocity: Point
}
