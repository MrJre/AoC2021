import XCTest
@testable import AdventOfCode

final class Day6Tests: XCTestCase {

    func testInputWithOneDay() {
        let input = "3,4,3,1,2"
        let fishes = parseDay6Input(from: input)
        let result = day6part1(input: fishes, numberOfDays: 1)
        XCTAssertEqual(result, [2,3,2,0,1])
        XCTAssertEqual(result.count, 5)
    }
    
    func testInputWithTwoDays() {
        let input = "3,4,3,1,2"
        let fishes = parseDay6Input(from: input)
        let result = day6part1(input: fishes, numberOfDays: 2)
        XCTAssertEqual(result, [1,2,1,6,0,8])
        XCTAssertEqual(result.count, 6)
    }
    
    func testInputWithThreeDays() {
        let input = "3,4,3,1,2"
        let fishes = parseDay6Input(from: input)
        let result = day6part1(input: fishes, numberOfDays: 3)
        XCTAssertEqual(result, [0,1,0,5,6,7,8])
        XCTAssertEqual(result.count, 7)
    }
    
    func testInputWithFourDays() {
        let input = "3,4,3,1,2"
        let fishes = parseDay6Input(from: input)
        let result = day6part1(input: fishes, numberOfDays: 4)
        XCTAssertEqual(result, [6,0,6,4,5,6,7,8,8])
        XCTAssertEqual(result.count, 9)
    }
    
    func testInputWithEighteenDays() {
        let input = "3,4,3,1,2"
        let fishes = parseDay6Input(from: input)
        let result = day6part1(input: fishes, numberOfDays: 18)
        XCTAssertEqual(result, [6,0,6,4,5,6,0,1,1,2,6,0,1,1,1,2,2,3,3,4,6,7,8,8,8,8])
        XCTAssertEqual(result.count, 26)
    }
    
    func testInputWithEightyDays() {
        let input = "3,4,3,1,2"
        let fishes = parseDay6Input(from: input)
        let result = day6part1(input: fishes, numberOfDays: 80)
        XCTAssertEqual(result.count, 5934)
    }
    
    func testInputWith256Days() {
        let input = "3,4,3,1,2"
        let fishes = parseDay6Input(from: input)
        let result = day6part2(input: fishes, numberOfDays: 256)
        XCTAssertEqual(result, 26984457539)
    }
    
    func testInputWithOneDayPart2() {
        let input = "3,4,3,1,2"
        let fishes = parseDay6Input(from: input)
        let result = day6part2(input: fishes, numberOfDays: 18)
        XCTAssertEqual(result, 26)
    }
}

