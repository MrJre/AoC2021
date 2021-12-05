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
}
