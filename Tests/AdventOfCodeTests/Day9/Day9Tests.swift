
import XCTest
@testable import AdventOfCode

class Day9Tests : XCTestCase {
    
    func testExampleCount() {
        let input = """
            2199943210
            3987894921
            9856789892
            8767896789
            9899965678
            """

        XCTAssertEqual(parseDay9Input(from: input).count, 50)
    }
    
    
    func testExampleHasLowCountOfFifteen() {
        let input = """
            2199943210
            3987894921
            9856789892
            8767896789
            9899965678
            """
        let nodes = parseDay9Input(from: input)
        let risk = day9part1(input: nodes)

        XCTAssertEqual(risk, 15)
    }
    
    func testFindBasinsForInputIsFour() {
        let input = """
            2199943210
            3987894921
            9856789892
            8767896789
            9899965678
            """
        let nodes = parseDay9Input(from: input)
        let basins = findBasins(lowestNodes: nodes.filter { $0.isLowerThanNeighbors() })

        XCTAssertEqual(basins.count, 4)
    }
    
    func testBasinSizes() {
        let input = """
            2199943210
            3987894921
            9856789892
            8767896789
            9899965678
            """
        let nodes = parseDay9Input(from: input)
        let basins = findBasins(lowestNodes: nodes.filter { $0.isLowerThanNeighbors() })
        let sizes = basins.map { $0.count }.sorted(by: <)
        
        XCTAssertEqual(sizes, [3,9,9,14])
    }
    
    func testBasinSize() {
        let input = """
            2199943210
            3987894921
            9856789892
            8767896789
            9899965678
            """
        let nodes = parseDay9Input(from: input)
        let size = day9part2(input: nodes)

        XCTAssertEqual(size, 1134)
    }
}
