import Foundation

func day4part1(input: Game) -> Int? {
    let result = input.playFirstWin()
    return result?.score()
}

func day4part2(input: Game) -> Int? {
    let result = input.playLastWin()
    return result?.score()
}

struct Game {
    let input: [Int]
    var cards: [BingoCard]
    
    init(input: [Int], cards: [BingoCard]) {
        self.input = input
        self.cards = cards
    }
    
    func playFirstWin() -> Result? {
        var sequence: [Int] = []
        for number in input {
            sequence.append(number)
            for card in cards {
                card.scratch(number: number)
                if card.hasBingo() {
                    return Result(sequence: sequence, card: card, finalNumber: number)
                }
            }
        }
        
        return nil
    }
    
    func playLastWin() -> Result? {
        var sequence: [Int] = []
        var result: Result? = nil
        
        var cards = cards
        
        for number in input {
            sequence.append(number)
            for card in cards {
                card.scratch(number: number)
                if card.hasBingo() {
                    result = Result(sequence: sequence, card: card, finalNumber: number)
                }
            }
            cards.removeAll { $0.hasBingo() }
        }
        
        return result
    }
}

struct Result {
    let sequence: [Int]
    let card: BingoCard
    let finalNumber: Int
    
    func score() -> Int {
        let sum = card.unmarked().reduce(0) { $0 + $1 }
        return sum * finalNumber
    }
}

struct BingoNumber {
    let number: Int
    var scratched: Bool
}

extension BingoNumber: Equatable, Hashable {
    static func == (lhs: BingoNumber, rhs: BingoNumber) -> Bool {
        lhs.number == rhs.number
    }
}

class BingoCard {
    var numbers: [BingoNumber]
    var cardSize: Int { Int(sqrt(Double(numbers.count))) }
    
    var variations: [Set<Int>] = []
    
    init(numbers: [Int]) {
        self.numbers = numbers.map { BingoNumber(number: $0, scratched: false) }
        variations = makeBingoVariations(numbers: numbers, cardSize: Int(sqrt(Double(numbers.count))))
    }
    
    func scratch(number: Int) {
        guard let index = numbers.firstIndex(of: BingoNumber(number: number, scratched: false)) else { return }
        numbers[index] = BingoNumber(number: number, scratched: true)
    }
    
    func hasBingo() -> Bool {
        for variation in variations {
            let numbers = numbers.filter { variation.contains($0.number) }
            if numbers.reduce(true, { $0 && $1.scratched }) { return true }
        }
        
        return false
    }
    
    func unmarked() -> [Int] {
        let unmarked = numbers.filter { !$0.scratched }.map { $0.number }
        return unmarked
    }
    
    func makeBingoVariations(numbers: [Int], cardSize: Int) -> [Set<Int>] {
        var bingoVariations: [Set<Int>] = []
        bingoVariations.append(contentsOf: getRows(from: numbers, cardSize: cardSize))
        bingoVariations.append(contentsOf: getColumns(from: numbers, cardSize: cardSize))
        return bingoVariations
    }
    
    func getRows(from numbers: [Int], cardSize: Int) -> [Set<Int>]{
        var bingoVariations: [Set<Int>] = []
        
        for row in 0..<cardSize {
            bingoVariations.append(Set(numbers[row*cardSize..<(row+1)*cardSize]))
        }
        
        return bingoVariations
    }
    
    func getColumns(from numbers: [Int], cardSize: Int) -> [Set<Int>] {
        var bingoVariations: [Set<Int>] = []
        
        for denominator in 0..<cardSize {
            var set = Set<Int>()
            for (index, number) in zip(numbers.indices, numbers) {
                if index % cardSize == denominator { set.insert(number) }
            }
            bingoVariations.append(set)
        }
        
        return bingoVariations
    }
}
