import XCTest
@testable import AdventOfCode

final class AdventOfCodeTests: XCTestCase {
    
    func testDay1Part1() throws {
        let file = file(forDay: 1)
        let input = parseDay1Input(from: file)
        XCTAssertEqual(day1part1(input: input), 1466)
    }
    
    func testDay1Part2() throws {
        let file = file(forDay: 1)
        let input = parseDay1Input(from: file)
        XCTAssertEqual(day1part2(input: input), 1491)
    }
    
    
    func testDay2Part1() throws {
        let file = file(forDay: 2)
        let input = parseDay2Input(from: file)
        XCTAssertEqual(day2part1(input: input), 1840243)
    }
    
    func testDay2Part2() throws {
        let file = file(forDay: 2)
        let input = parseDay2Input(from: file)
        XCTAssertEqual(day2part2(input: input), 1727785422)
    }
    
    
    func testDay3Part1() throws {
        let file = file(forDay: 3)
        let input = parseDay3Input(from: file)
        XCTAssertEqual(day3part1(input: input), 3009600)
    }
    
    func testDay3Part2() throws {
        let file = file(forDay: 3)
        let input = parseDay3Input(from: file)
        XCTAssertEqual(day3part2(input: input), 6940518)
    }
    
    
    func testDay4Part1() throws {
        let file = file(forDay: 4)
        let input = parseDay4Input(from: file)
        XCTAssertEqual(day4part1(input: input), 49860)
    }
    
    func testDay4Part2() throws {
        let file = file(forDay: 4)
        let input = parseDay4Input(from: file)
        XCTAssertEqual(day4part2(input: input), 24628)
    }
    
    
    func testDay5Part1() throws {
        let file = file(forDay: 5)
        let input = parseDay5Input(from: file)
        XCTAssertEqual(day5Part1(input: input), 8060)
    }
    
    func testDay5Part2() throws {
        let file = file(forDay: 5)
        let input = parseDay5Input(from: file)
        XCTAssertEqual(day5Part2(input: input), 21577)
    }
    
   
    func testDay6Part1() throws {
        let file = file(forDay: 6)
        let input = parseDay6Input(from: file)
        XCTAssertEqual(day6part2(input: input, numberOfDays: 80), 379414)
    }

    func testDay6Part2() throws {
        let file = file(forDay: 6)
        let input = parseDay6Input(from: file)
        XCTAssertEqual(day6part2(input: input, numberOfDays: 256), 1705008653296)
    }
    
    
    func testDay7Part1() throws {
        let file = file(forDay: 7)
        let input = parseDay7Input(from: file)
        XCTAssertEqual(day7part1(input: input), 342534)
    }

    func testDay7Part2() throws {
        let file = file(forDay: 7)
        let input = parseDay7Input(from: file)
        XCTAssertEqual(day7part2(input: input), 94004208)
    }
    
    func testDay7Part2Alternate() throws {
        let file = file(forDay: 7)
        let input = parseDay7Input(from: file)
        XCTAssertEqual(day7part2Mean(input: input), 94004208)
    }
}
