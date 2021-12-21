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
    
    
    func testDay8Part1() throws {
        let file = file(forDay: 8)
        let input = parseDay8Input(from: file)
        XCTAssertEqual(day8part1(input: input), 534)
    }

    func testDay8Part2() throws {
        let file = file(forDay: 8)
        let input = parseDay8Input(from: file)
        XCTAssertEqual(day8part2(input: input), 1070188)
    }
    
    
    func testDay9Part1() throws {
        let file = file(forDay: 9)
        let input = parseDay9Input(from: file)
        XCTAssertEqual(day9part1(input: input), 545)
    }

    func testDay9Part2() throws {
        let file = file(forDay: 9)
        let input = parseDay9Input(from: file)
        XCTAssertEqual(day9part2(input: input), 950600)
    }
    
    func testDay10Part1() throws {
        let file = file(forDay: 10)
        let input = parseDay10Input(from: file)
        XCTAssertEqual(day10part1(input: input), 358737)
    }

    func testDay10Part2() throws {
        let file = file(forDay: 10)
        let input = parseDay10Input(from: file)
        XCTAssertEqual(day10part2(input: input), 4329504793)
    }

    
    func testDay11Part1() throws {
        let file = file(forDay: 11)
        let input = parseDay11Input(from: file)
        XCTAssertEqual(day11part1(input: input, numberOfSteps: 100), 1625)
    }

    func testDay11Part2() throws {
        let file = file(forDay: 11)
        let input = parseDay11Input(from: file)
        XCTAssertEqual(day11part2(input: input), 244)
    }
    
    func testDay12Part1() throws {
        let file = file(forDay: 12)
        let input = parseDay12Input(from: file)
        XCTAssertEqual(day12part1(nodes: input), 4792)
    }

    func testDay12Part2() throws {
        let file = file(forDay: 12)
        let input = parseDay12Input(from: file)
        XCTAssertEqual(day12part2(nodes: input), 133360)
    }
    
    func testDay13Part1() throws {
        let file = file(forDay: 13)
        let input = parseDay13Input(from: file)
        XCTAssertEqual(day13part1(input: input), 759)
    }

    func testDay13Part2() throws {
        let file = file(forDay: 13)
        let input = parseDay13Input(from: file)
        
        let result = """
            #..#.####..##..###..####.#..#.###..###..
            #..#.#....#..#.#..#....#.#.#..#..#.#..#.
            ####.###..#....#..#...#..##...#..#.#..#.
            #..#.#....#....###...#...#.#..###..###..
            #..#.#....#..#.#.#..#....#.#..#....#.#..
            #..#.####..##..#..#.####.#..#.#....#..#.
            """
        
        XCTAssertEqual(day13part2(input: input), result)
    }
    
    func testDay14Part1() throws {
        let file = file(forDay: 14)
        let input = parseDay14Input(from: file)
        XCTAssertEqual(day14part1(input: input, numberOfSteps: 10), 2375)
    }

    func testDay14Part2() throws {
        let file = file(forDay: 14)
        let input = parseDay14Input(from: file)
        XCTAssertEqual(day14part2(input: input, numberOfSteps: 40), 1976896901756)
    }
    
    func testDay15Part1() throws {
        let file = file(forDay: 15)
        let input = parseDay15Input(from: file)
        XCTAssertEqual(day15part1(input: input), 508)
    }

    func testDay15Part2() throws {
        let file = file(forDay: 15)
        let input = parseDay15Input(from: file)
        XCTAssertEqual(day15part2(input: input), 2872)
    }
    
    func testDay16Part1() throws {
        let file = file(forDay: 16)
        let input = parseDay16Input(from: file)
        XCTAssertEqual(day16part1(input: input), 999)
    }

    func testDay16Part2() throws {
        let file = file(forDay: 16)
        let input = parseDay16Input(from: file)
        XCTAssertEqual(day16part2(input: input), 3408662834145)
    }
    
    func testDay17Part1() throws {
        let file = file(forDay: 17)
        let input = parseDay17Input(from: file)
        
        XCTAssertEqual(day17part1(input: input), 19503)
    }

    func testDay17Part2() throws {
        let file = file(forDay: 17)
        let input = parseDay17Input(from: file)
        XCTAssertEqual(day17part2(input: input), 5200)
    }
}
