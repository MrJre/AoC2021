import Foundation
import XCTest
@testable import AdventOfCode

class Day12Tests : XCTestCase {
    func testSmallExample() throws {
        /*
         start
         /   \
     c--A-----b--d
         \   /
          end
         */
        
        let input = """
            start-A
            start-b
            A-c
            A-b
            b-d
            A-end
            b-end
            """
        XCTAssertEqual(day12part1(nodes: parseDay12Input(from: input)), 10)
    }
    
    func testLargerExample() throws {
        let input = """
            dc-end
            HN-start
            start-kj
            dc-start
            dc-HN
            LN-dc
            HN-end
            kj-sa
            kj-HN
            kj-dc
            """
        XCTAssertEqual(day12part1(nodes: parseDay12Input(from: input)), 19)
    }
    
    func testLargeExample() throws {
        let input = """
            fs-end
            he-DX
            fs-he
            start-DX
            pj-DX
            end-zg
            zg-sl
            zg-pj
            pj-he
            RW-he
            fs-DX
            pj-RW
            zg-RW
            start-pj
            he-WI
            zg-he
            pj-fs
            start-RW
            """
        XCTAssertEqual(day12part1(nodes: parseDay12Input(from: input)), 226)
    }
    
    func testSmallExampleWith2VisitsPerSmallNode() throws {
        /*
         start
         /   \
     c--A-----b--d
         \   /
          end
         */
        
        let input = """
            start-A
            start-b
            A-c
            A-b
            b-d
            A-end
            b-end
            """
        XCTAssertEqual(day12part2(nodes: parseDay12Input(from: input)), 36)
    }
    
    func testLargerExampleWith2VisitsPerSmallNode() throws {
        let input = """
            dc-end
            HN-start
            start-kj
            dc-start
            dc-HN
            LN-dc
            HN-end
            kj-sa
            kj-HN
            kj-dc
            """
        XCTAssertEqual(day12part2(nodes: parseDay12Input(from: input)), 103)
    }
    
    func testLargeExampleWith2VisitsPerSmallNode() throws {
        let input = """
            fs-end
            he-DX
            fs-he
            start-DX
            pj-DX
            end-zg
            zg-sl
            zg-pj
            pj-he
            RW-he
            fs-DX
            pj-RW
            zg-RW
            start-pj
            he-WI
            zg-he
            pj-fs
            start-RW
            """
        XCTAssertEqual(day12part2(nodes: parseDay12Input(from: input)), 3509)
    }
}
