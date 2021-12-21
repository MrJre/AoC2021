import Foundation
import XCTest
@testable import AdventOfCode

class Day16Tests : XCTestCase {
 
    func testParseInput() throws {
        let input = "D2FE28"
        
        XCTAssertEqual(["1101","0010","1111","1110","0010","1000"], parseDay16Input(from: input))
    }
    
    func testLiteral() throws {
        var bitString = ["1101","0010","1111","1110","0010","1000"]

        XCTAssertEqual(parsePacket(from: &bitString), Packet(version: 6, type: .literal, payload: .literal(2021)))
    }
    
    func testOperatorWithSubPacketBitCount() throws {
        let input = "38006F45291200"
        var bitString = parseDay16Input(from: input)
        
        let lit1 = Packet(version: 6, type: .literal, payload: .literal(10))
        let lit2 = Packet(version: 2, type: .literal, payload: .literal(20))
        let packet = Packet(version: 1, type: .lessThan, payload: .oper([lit1, lit2]))
        
        XCTAssertEqual(parsePacket(from: &bitString), packet)
    }
    
    func testOperatorWithSubPacketCount() throws {
        let input = "EE00D40C823060"
        var bitString = parseDay16Input(from: input)
        
        let lit1 = Packet(version: 2, type: .literal, payload: .literal(1))
        let lit2 = Packet(version: 4, type: .literal, payload: .literal(2))
        let lit3 = Packet(version: 1, type: .literal, payload: .literal(3))
        let packet = Packet(version: 7, type: .max, payload: .oper([lit1, lit2, lit3]))
        
        XCTAssertEqual(parsePacket(from: &bitString), packet)
    }
    
    func testPart1Example1() throws {
        let input = "8A004A801A8002F478"
        let bitString = parseDay16Input(from: input)
        
        XCTAssertEqual(day16part1(input: bitString), 16)
    }
    
    func testPart1Example2() throws {
        let input = "620080001611562C8802118E34"
        let bitString = parseDay16Input(from: input)
        
        XCTAssertEqual(day16part1(input: bitString), 12)
    }
    
    func testPart1Example3() throws {
        let input = "C0015000016115A2E0802F182340"
        let bitString = parseDay16Input(from: input)
        
        XCTAssertEqual(day16part1(input: bitString), 23)
    }
    
    func testPart1Example4() throws {
        let input = "A0016C880162017C3686B18A3D4780"
        let bitString = parseDay16Input(from: input)
        
        XCTAssertEqual(day16part1(input: bitString), 31)
    }
    
    func testPart2SumExample() throws {
        let input = "C200B40A82"
        let bitString = parseDay16Input(from: input)
        
        XCTAssertEqual(day16part2(input: bitString), 3)
    }
    
    func testPart2ProductExample() throws {
        let input = "04005AC33890"
        let bitString = parseDay16Input(from: input)
        
        XCTAssertEqual(day16part2(input: bitString), 54)
    }
    
    func testPart2MinExample() throws {
        let input = "880086C3E88112"
        let bitString = parseDay16Input(from: input)
        
        XCTAssertEqual(day16part2(input: bitString), 7)
    }
    
    func testPart2MaxExample() throws {
        let input = "CE00C43D881120"
        let bitString = parseDay16Input(from: input)
        
        XCTAssertEqual(day16part2(input: bitString), 9)
    }
    
    func testPart2GreaterThanExample() throws {
        let input = "D8005AC2A8F0"
        let bitString = parseDay16Input(from: input)
        
        XCTAssertEqual(day16part2(input: bitString), 1)
    }
    
    func testPart2LessThanExample() throws {
        let input = "F600BC2D8F"
        let bitString = parseDay16Input(from: input)
        
        XCTAssertEqual(day16part2(input: bitString), 0)
    }
    
    func testPart2EqualsExample() throws {
        let input = "9C005AC2F8F0"
        let bitString = parseDay16Input(from: input)
        
        XCTAssertEqual(day16part2(input: bitString), 0)
    }
    
    func testPart2ComplexExample() throws {
        let input = "9C0141080250320F1802104A08"
        let bitString = parseDay16Input(from: input)
        
        XCTAssertEqual(day16part2(input: bitString), 1)
    }
}
