import XCTest
@testable import AdventOfCode

final class Day4Tests: XCTestCase {

    func testGetRows() {
        let input = [0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24]
        let bingoCard = BingoCard(numbers: input)
        
        print(bingoCard.getRows(from: input, cardSize: 5))
    }
    
    func testGetColumns() {
        let input = [0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24]
        let bingoCard = BingoCard(numbers: input)
        
        print(bingoCard.getColumns(from: input, cardSize: 5))
    }
    
    func testHasBingo() {
        let card = [0,1,2,3,4,5,6,7,8]
        let bingoCard = BingoCard(numbers: card)
        
        let sequence = [0,1,2,5,8]
        sequence.forEach { bingoCard.scratch(number: $0) }
        XCTAssert(bingoCard.hasBingo())
    }

    func testHasBingo2() {
        let input = [0,1,2,3,4,5,6,7,8]
        let bingoCard = BingoCard(numbers: input)
        
        let sequence = [0,3,6]
        sequence.forEach { bingoCard.scratch(number: $0) }
        XCTAssert(bingoCard.hasBingo())
    }
    
    func testUnmarked() {
        let input = [0,1,2,3,4,5,6,7,8]
        let bingoCard = BingoCard(numbers: input)
        
        let game = Game(input: [0,3,6], cards: [bingoCard])
        let result = game.playFirstWin()
        
        XCTAssertEqual(result?.score(), (1 + 2 + 4 + 5 + 7 + 8) * 6)
    }
    
    func testDay4Input() {
        let game = day4Input()
        
        XCTAssertEqual(game.cards.count, 100)
    }
}
