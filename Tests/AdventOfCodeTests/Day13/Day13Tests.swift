import Foundation
import XCTest
@testable import AdventOfCode

class Day13Tests : XCTestCase {
    func testParsing() throws {
        let input = """
        6,10
        0,14
        9,10
        0,3
        10,4
        4,11
        6,0
        6,12
        4,1
        0,13
        10,12
        3,4
        3,0
        8,4
        1,10
        2,14
        8,10
        9,0

        fold along y=7
        fold along x=5
        """
        
        let result = """
            ...#..#..#.
            ....#......
            ...........
            #..........
            ...#....#.#
            ...........
            ...........
            ...........
            ...........
            ...........
            .#....#.##.
            ....#......
            ......#...#
            #..........
            #.#........
            """
        
        XCTAssertEqual(result, parseDay13Input(from: input).0.description)
    }
    
    func testVerticalFlip() throws {
        let input = """
        0,3
        10,4
        6,0
        4,1
        3,4
        3,0
        8,4
        9,0
        """
        let result = """
            ...#....#.#
            #..........
            ...........
            ....#......
            ...#..#..#.
            """
        
        let inputGrid = parseDay13Input(from: input).0
        
        XCTAssertEqual(inputGrid.flipVertically().description, result)
    }
    
    func testCombine() throws {
        let gridA = PointGrid(grid: ["#",".","#","."], width: 2)
        let gridB = PointGrid(grid: [".","#",".","#"], width: 2)
        
        XCTAssertEqual(gridA.combineWith(other: gridB).description, PointGrid(grid: ["#","#","#","#"], width: 2).description)
    }
    
    func testApplyFirstFold() throws {
        let input = """
        6,10
        0,14
        9,10
        0,3
        10,4
        4,11
        6,0
        6,12
        4,1
        0,13
        10,12
        3,4
        3,0
        8,4
        1,10
        2,14
        8,10
        9,0

        fold along y=7
        fold along x=5
        """
        let gridAndFolds = parseDay13Input(from: input)
        let grid = gridAndFolds.0.apply(fold: gridAndFolds.1[0])
        
        XCTAssertEqual(grid.dotCount, 17)
    }
    
    func testApplyFolds() throws {
        let input = """
        6,10
        0,14
        9,10
        0,3
        10,4
        4,11
        6,0
        6,12
        4,1
        0,13
        10,12
        3,4
        3,0
        8,4
        1,10
        2,14
        8,10
        9,0

        fold along y=7
        fold along x=5
        """
        
        let gridAndFolds = parseDay13Input(from: input)
        var grid = gridAndFolds.0
        for fold in gridAndFolds.1 {
            grid = grid.apply(fold: fold)
        }
        
        let result = """
            #####
            #...#
            #...#
            #...#
            #####
            .....
            .....
            """
        XCTAssertEqual(grid.description, result)
    }
}
