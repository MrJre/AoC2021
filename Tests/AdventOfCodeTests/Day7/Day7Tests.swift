import XCTest
@testable import AdventOfCode

final class Day7Tests: XCTestCase {

    func testPart1FuelForSwarmToTargetTwo() {
        let input = "16,1,2,0,4,2,7,1,2,14"
        let subs = parseDay7Input(from: input)
        let result = part1fuel(for: subs, toTarget: 2)
        
        XCTAssertEqual(result, 37)
    }
    
    func testPart1FuelForSwarmToTargetTen() {
        let input = "16,1,2,0,4,2,7,1,2,14"
        let subs = parseDay7Input(from: input)
        let result = part1fuel(for: subs, toTarget: 10)
        
        XCTAssertEqual(result, 71)
    }
    
    func testMedian() {
        let input = [1,2,3]
        let median = findMedian(for: input)
        
        XCTAssertEqual(median, 2)
    }
    
    func testMeanForInput() {
        let input = "16,1,2,0,4,2,7,1,2,14"
        let subs = parseDay7Input(from: input)
        let median = findMedian(for: subs)
        
        XCTAssertEqual(median, 2)
    }
    
    func testPart2FuelForSwarmToTargetTwo() {
        let input = "16,1,2,0,4,2,7,1,2,14"
        let subs = parseDay7Input(from: input)
        let result = part2fuel(for: subs, toTarget: 2)
        
        XCTAssertEqual(result, 206)
    }
    
    func testPart2FuelForSwarmToTargetFive() {
        let input = "16,1,2,0,4,2,7,1,2,14"
        let subs = parseDay7Input(from: input)
        let result = part2fuel(for: subs, toTarget: 5)
        
        XCTAssertEqual(result, 168)
    }
    
    func testPart2() {
        let input = "16,1,2,0,4,2,7,1,2,14"
        let subs = parseDay7Input(from: input)
        let result = day7part2(input: subs)
        
        XCTAssertEqual(result, 168)
    }
}
