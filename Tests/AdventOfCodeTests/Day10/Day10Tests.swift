import XCTest
@testable import AdventOfCode

class Day10Tests : XCTestCase {
   
    func testValidLine() {
        let input = "{}"
        XCTAssertEqual(try validateLine(input), true)
    }
    
    func testValidLineWithMultipleChunks() {
        let input = "[<>({}){}[([])<>]]"
        XCTAssertEqual(try validateLine(input), true)
    }
    
    func testInvalidLine() {
        let input = "{{"
        XCTAssertThrowsError(try validateLine(input)) { error in
            XCTAssertEqual(error as! LineError, LineError.incomplete(line: "{{"))
        }
    }
    
    func testInvalidLineWithMultipleChunks() {
        let input = "{([(<{}[<>[]}>{[]{[(<()>"
        
        XCTAssertThrowsError(try validateLine(input)) { error in
            XCTAssertEqual(error as! LineError, LineError.illegalCharacter(character: "}"))
        }
    }
    
    func testInvalidCharacterScore() {
        let input = """
            [({(<(())[]>[[{[]{<()<>>
            [(()[<>])]({[<{<<[]>>(
            {([(<{}[<>[]}>{[]{[(<()>
            (((({<>}<{<{<>}{[]{[]{}
            [[<[([]))<([[{}[[()]]]
            [{[{({}]{}}([{[{{{}}([]
            {<[[]]>}<{[{[{[]{()[[[]
            [<(<(<(<{}))><([]([]()
            <{([([[(<>()){}]>(<<{{
            <{([{{}}[<[[[<>{}]]]>[]]
            """
        XCTAssertEqual(day10part1(input: parseDay10Input(from: input)), 26397)
    }
    
    func testScore() {
        let input = "<{([{{}}[<[[[<>{}]]]>[]]"
        XCTAssertEqual(day10part2(input: parseDay10Input(from: input)), 294)
    }
    
    func testClosingCharacterScore() {
        let input = """
            [({(<(())[]>[[{[]{<()<>>
            [(()[<>])]({[<{<<[]>>(
            {([(<{}[<>[]}>{[]{[(<()>
            (((({<>}<{<{<>}{[]{[]{}
            [[<[([]))<([[{}[[()]]]
            [{[{({}]{}}([{[{{{}}([]
            {<[[]]>}<{[{[{[]{()[[[]
            [<(<(<(<{}))><([]([]()
            <{([([[(<>()){}]>(<<{{
            <{([{{}}[<[[[<>{}]]]>[]]
            """
        XCTAssertEqual(day10part2(input: parseDay10Input(from: input)), 288957)
    }
}
