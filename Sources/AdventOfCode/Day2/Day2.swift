import Foundation

enum Movement {
    
    init?(_ string: String) {
        let movement = string.split(separator: " ")
        switch movement.first! {
            case "forward":
                self = .forward(Int(movement.last!)!)
            case "down":
                self = .vertical(Int(movement.last!)!)
            case "up":
                self = .vertical(-Int(movement.last!)!)
            default:
                return nil
        }
    }
    
    case vertical(Int)
    case forward(Int)
}



func day2part1(input: [Movement]) -> Int {
    var depthTotal = 0
    var motionTotal = 0
    
    for movement in input {
        switch movement {
            case .vertical(let amount): depthTotal += amount
            case .forward(let amount): motionTotal += amount
        }
    }
    
    return depthTotal * motionTotal
}
    
func day2part2(input: [Movement]) -> Int {
    var depthTotal = 0
    var motionTotal = 0
    var aimTotal = 0
    
    for movement in input {
        switch movement {
            case .vertical(let amount):
                aimTotal += amount
            case .forward(let amount):
                motionTotal += amount
                depthTotal += aimTotal * amount
        }
    }
    
    return depthTotal * motionTotal
}
