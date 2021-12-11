import Foundation
import XCTest
@testable import AdventOfCode

class Day11Tests : XCTestCase {
 
    func testStep() throws {
        let input = """
            11111
            19991
            19191
            19991
            11111
            """
        XCTAssertEqual(step(input: parseDay11Input(from: input)), 9)
    }
    
    func testTwoSteps() throws {
        let input = """
            11111
            19991
            19191
            19991
            11111
            """
        XCTAssertEqual(day11part1(input: parseDay11Input(from: input), numberOfSteps: 2), 9)
    }
    
    func testLargerExample() throws {
        let input = """
            5483143223
            2745854711
            5264556173
            6141336146
            6357385478
            4167524645
            2176841721
            6882881134
            4846848554
            5283751526
            """
        XCTAssertEqual(day11part1(input: parseDay11Input(from: input), numberOfSteps: 10), 204)
    }
}

