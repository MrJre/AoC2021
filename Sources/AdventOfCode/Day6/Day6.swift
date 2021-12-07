import Foundation

func day6part1(input: [Int], numberOfDays: Int) -> [Int] {
    
    var fishes = input

    for _ in 0..<numberOfDays {
        for (index, fish) in zip(fishes.indices, fishes) {
            if fish == 0 {
                fishes.append(8)
                fishes[index] = 6
            } else {
                fishes[index] = fishes[index] - 1
            }
        }
    }
    
    return fishes
}

func day6part2(input: [Int], numberOfDays: Int) -> Int {
    
    var buckets: [Int] = input.reduce([0,0,0,0,0,0,0,0,0]) {
        var array = $0
        array[$1] += 1
        return array
    }
    
    for _ in 0..<numberOfDays {
        let fishMultiplyingToday = buckets.removeFirst()
        buckets[6] += fishMultiplyingToday
        buckets.append(fishMultiplyingToday)
    }
            
    return buckets.reduce(0, +)
}


