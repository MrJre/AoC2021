import Foundation
import XCTest
@testable import AdventOfCode

class Day14Tests : XCTestCase {
    
    func testParsing() {
        let input = """
            NNCB

            CH -> B
            HH -> N
            CB -> H
            NH -> C
            HB -> C
            HC -> B
            HN -> C
            NN -> C
            BH -> H
            NC -> B
            NB -> B
            BN -> B
            BB -> N
            BC -> B
            CC -> N
            CN -> C
            """
        
        let result = parseDay14Input(from: input)
        XCTAssertEqual(result.0, "NNCB")
    }
    
    func testStep() throws {
        let input = """
            NNCB

            CH -> B
            HH -> N
            CB -> H
            NH -> C
            HB -> C
            HC -> B
            HN -> C
            NN -> C
            BH -> H
            NC -> B
            NB -> B
            BN -> B
            BB -> N
            BC -> B
            CC -> N
            CN -> C
            """
        let parsedInput = parseDay14Input(from: input)
        
        let result = takePart1Step(polymer: parsedInput.0, mapping: parsedInput.1)
    
        XCTAssertEqual(result, "NCNBCHB")
    }
    
    func testTwoSteps() throws {
        let input = """
            NNCB

            CH -> B
            HH -> N
            CB -> H
            NH -> C
            HB -> C
            HC -> B
            HN -> C
            NN -> C
            BH -> H
            NC -> B
            NB -> B
            BN -> B
            BB -> N
            BC -> B
            CC -> N
            CN -> C
            """
        let parsedInput = parseDay14Input(from: input)
        
        let step1 = takePart1Step(polymer: parsedInput.0, mapping: parsedInput.1)
        let result = takePart1Step(polymer: step1, mapping: parsedInput.1)
        
        XCTAssertEqual(result, "NBCCNBBBCBHCB")
    }
    
    func testTwoStepsResult() throws {
        let input = """
            NNCB

            CH -> B
            HH -> N
            CB -> H
            NH -> C
            HB -> C
            HC -> B
            HN -> C
            NN -> C
            BH -> H
            NC -> B
            NB -> B
            BN -> B
            BB -> N
            BC -> B
            CC -> N
            CN -> C
            """
        let parsedInput = parseDay14Input(from: input)
        let result = day14part1(input: parsedInput, numberOfSteps: 2)
        
        XCTAssertEqual(result, 5)
    }
    
    func testPart2Step() throws {
        let input = """
            NNCB

            CH -> B
            HH -> N
            CB -> H
            NH -> C
            HB -> C
            HC -> B
            HN -> C
            NN -> C
            BH -> H
            NC -> B
            NB -> B
            BN -> B
            BB -> N
            BC -> B
            CC -> N
            CN -> C
            """
        let parsedInput = parseDay14Input(from: input)
        
        let result = day14part2(input: parsedInput, numberOfSteps: 1)
    
        XCTAssertEqual(result, 1)
    }
    
    func testPart2TwoStepsResult() throws {
        let input = """
            NNCB

            CH -> B
            HH -> N
            CB -> H
            NH -> C
            HB -> C
            HC -> B
            HN -> C
            NN -> C
            BH -> H
            NC -> B
            NB -> B
            BN -> B
            BB -> N
            BC -> B
            CC -> N
            CN -> C
            """
        let parsedInput = parseDay14Input(from: input)
        
        let result = day14part2(input: parsedInput, numberOfSteps: 2)
    
        XCTAssertEqual(result, 5)
    }
    
    func testPart2ThreeStepsResult() throws {
        let input = """
            NNCB

            CH -> B
            HH -> N
            CB -> H
            NH -> C
            HB -> C
            HC -> B
            HN -> C
            NN -> C
            BH -> H
            NC -> B
            NB -> B
            BN -> B
            BB -> N
            BC -> B
            CC -> N
            CN -> C
            """
        let parsedInput = parseDay14Input(from: input)
        
        let result = day14part2(input: parsedInput, numberOfSteps: 3)
        
        XCTAssertEqual(result, 7)
    }
    
    func testPart2FourStepsResult() throws {
        let input = """
            NNCB

            CH -> B
            HH -> N
            CB -> H
            NH -> C
            HB -> C
            HC -> B
            HN -> C
            NN -> C
            BH -> H
            NC -> B
            NB -> B
            BN -> B
            BB -> N
            BC -> B
            CC -> N
            CN -> C
            """
        let parsedInput = parseDay14Input(from: input)
        
        let result = day14part2(input: parsedInput, numberOfSteps: 4)
       
        XCTAssertEqual(result, 18)
    }
}
