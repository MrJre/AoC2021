import Foundation

func parseDay4Input(from file: String) -> Game {
    var lines = file.split(separator: "\n", omittingEmptySubsequences: false).map { String($0) }
    
    let input = lines.first!.split(separator: ",").compactMap { Int($0) }
    lines = Array(lines.dropFirst())
    
    var cards: [BingoCard] = []
    var card: [Int] = []
    for line in lines {
        if line.isEmpty, card.count > 0 {
            cards.append(BingoCard(numbers: card))
            card = []
        } else {
            let cardLine = line.split(separator: " ").compactMap { Int($0) }
            card.append(contentsOf: cardLine)
        }
    }
    
    return Game(input: input, cards: cards)
}

