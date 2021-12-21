import Foundation
import XCTest
@testable import AdventOfCode

class Day17Tests : XCTestCase {
    func testParsingFile() throws {
        let file = file(forDay: 17)
        XCTAssertEqual(parseDay17Input(from: file), Box(minX: 57, maxX: 116, minY: -198, maxY: -148))
    }
    
    func testParsingInput() throws {
        let input = "target area: x=20..30, y=-10..-5"
        let box = parseDay17Input(from: input)
        
        XCTAssertEqual(box, Box(minX: 20, maxX: 30, minY: -10, maxY: -5))
    }
    
    func testIsPointInBox() throws {
        let input = "target area: x=20..30, y=-10..-5"
        let box = parseDay17Input(from: input)
        
        XCTAssertTrue(box.isInBox(point: Point(x: 20, y: -10)))
    }
    
    func testShootWithVelocityx7y2IsValid() throws {
        let input = "target area: x=20..30, y=-10..-5"
        let box = parseDay17Input(from: input)
        
        XCTAssertTrue(shootWithVelocityHitsBox(Point(x: 7, y: 2), from: Point(x: 0, y: 0), given: box))
    }
    
    func testShootWithVelocityx6y3IsValid() throws {
        let input = "target area: x=20..30, y=-10..-5"
        let box = parseDay17Input(from: input)
        
        XCTAssertTrue(shootWithVelocityHitsBox(Point(x: 6, y: 3), from: Point(x: 0, y: 0), given: box))
    }
    
    func testShootWithVelocityx9y0IsValid() throws {
        let input = "target area: x=20..30, y=-10..-5"
        let box = parseDay17Input(from: input)
        
        XCTAssertTrue(shootWithVelocityHitsBox(Point(x: 9, y: 0), from: Point(x: 0, y: 0), given: box))
    }
    
    func testShootWithVelocityx17yMin4IsInvalid() throws {
        let input = "target area: x=20..30, y=-10..-5"
        let box = parseDay17Input(from: input)
        
        XCTAssertFalse(shootWithVelocityHitsBox(Point(x: 17, y: -4), from: Point(x: 0, y: 0), given: box))
    }
    
    func testExample1() throws {
        let input = "target area: x=20..30, y=-10..-5"
        let box = parseDay17Input(from: input)
        
        XCTAssertEqual(day17part1(input: box), 45)
    }
    
    func testExample1Count() throws {
        let input = "target area: x=20..30, y=-10..-5"
        let box = parseDay17Input(from: input)
        
        XCTAssertEqual(day17part2(input: box), 112)
    }
}
