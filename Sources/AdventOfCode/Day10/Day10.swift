import Foundation

enum LineError: Error, Equatable {
    case illegalCharacter(character: Character)
    case incomplete(line: String)
}

func day10part1(input: [String]) -> Int {
    
    var illegalCharacters: [Character] = []
    
    for line in input {
        do {
            try validateLine(line)
        } catch LineError.illegalCharacter(let character) {
            illegalCharacters.append(character)
        } catch {}
    }
    
    return illegalCharacters.reduce(0) { $0 + scoreIllegalCharacter($1) }
}

func scoreIllegalCharacter(_ character: Character) -> Int {
    switch character {
        case ")": return 3
        case "]": return 57
        case "}": return 1197
        case ">": return 25137
        default: return 0
    }
}

func day10part2(input: [String]) -> Int {
    
    var scores: [Int] = []
    
    for line in input {
        do {
            try validateLine(line)
        } catch LineError.incomplete(let line) {
            let missingCharacters = findMissingCharacters(for: line)
            scores.append(scoreIncompleteCharacters(missingCharacters))
        } catch {}
    }

    return scores.sorted(by: <)[scores.count / 2]
}

@discardableResult func validateLine(_ line: String) throws -> Bool {
    
    var result: [Character] = []
    
    for character in line {
        switch character {
            case "{", "[", "(", "<": result.append(character)
            case "}", "]", ")", ">":
                let matchingCharacter = matchingCharacter(for: result.popLast())
                if matchingCharacter != character {
                    throw LineError.illegalCharacter(character: character)
                }
            default: break
        }
    }
    
    if !result.isEmpty { throw LineError.incomplete(line: String(result)) }
    
    return true
}

func matchingCharacter(for character: Character?) -> Character? {
    switch character {
        case "(": return ")"
        case "[": return "]"
        case "{": return "}"
        case "<": return ">"
        default: return nil
    }
}

func findMissingCharacters(for line: String) -> String {
    let result = line.reversed().compactMap(matchingCharacter)
    return String(result)
}

func scoreIncompleteCharacters(_ incompleteCharacters: String) -> Int {
    incompleteCharacters.reduce(0) { $0 * 5 + scoreClosingCharacter($1) }
}

func scoreClosingCharacter(_ char: Character) -> Int {
    switch char {
        case ")": return 1
        case "]": return 2
        case "}": return 3
        case ">": return 4
        default: return 0
    }
}
