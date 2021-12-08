import XCTest
@testable import AdventOfCode

final class Day8Tests: XCTestCase {

    func testParseDay8Input() throws
    {
        let input = parseDay8Input(from: file(forDay: 8))
        XCTAssertEqual(input.count, 200)
    }
    
    func testExampleInput() throws {
        let input = "acedgfb cdfbe gcdfa fbcad dab cefabd cdfgeb eafb cagedb ab | cdfeb fcadb cdfeb cdbaf"
        
        let entries = parseDay8Input(from: input)
        XCTAssertEqual(numberForEntry(entries.first!), 5353)
    }
}
