import Foundation

func day16part1(input: [String]) -> Int {
    
    var bitString = input
    
    let packet = parsePacket(from: &bitString)
    let result = scorePacketVersions(packet)

    return result
}

func scorePacketVersions(_ packet: Packet) -> Int {

    var score = packet.version
    
    switch packet.payload {
        case .literal(_):
            break
        case .oper(let packets):
            for packet in packets {
                score += scorePacketVersions(packet)
            }
    }
    
    return score
}

func day16part2(input: [String]) -> Int
{
    var bitString = input
    
    let packet = parsePacket(from: &bitString)
    let result = packet.calcValue()
    
    return result
}

func parsePacket(from bitString: inout [String]) -> Packet
{
    let version = Int(remove(3, from: &bitString), radix: 2)!
    let type = remove(3, from: &bitString)
    let packetType = PacketType(rawValue: Int(String(type), radix: 2)!)!
    
    let payload: PacketPayload
    
    switch packetType {
        case .literal:
            payload = parseLiteral(from: &bitString)
        default:
            payload = parseOperator(from: &bitString)
    }
    
    return Packet(version: version, type: packetType, payload: payload)
}

func parseLiteral(from bitString: inout [String]) -> PacketPayload
{
    var number: String = ""
    var hasNext = true
    while hasNext {
        let nextBit = remove(5, from: &bitString)
        
        hasNext = nextBit.prefix(1) == "1"
        number += nextBit.dropFirst(1)
    }
    
    return .literal(Int(number, radix: 2)!)
}

func parseOperator(from bitString: inout [String]) -> PacketPayload
{
    var packets: [Packet] = []
    
    let lengthTypeIDString = remove(1, from: &bitString)
    let lengthTypeID = LengthType(rawValue: Int(lengthTypeIDString)!)!
    let lengthBits = remove(lengthTypeID.numberOfBits(), from: &bitString)
    
    switch lengthTypeID {
        case .subPacketBitCount:
            let subPacketsLength = Int(lengthBits, radix: 2)!
            var bits = removeBits(subPacketsLength, from: &bitString)
            
            while bits.flatMap({ $0 }).count > 0 {
                packets.append(parsePacket(from: &bits))
            }
            
        case .subPacketCount:
            let numberOfSubPackets = Int(lengthBits, radix: 2)!
            while packets.count < numberOfSubPackets {
                packets.append(parsePacket(from: &bitString))
            }
    }
    
    return .oper(packets)
}

func removeBits(_ k: Int, from bitString: inout [String]) -> [String] {
    var count = k
    var result: [String] = []
    
    while !bitString.isEmpty {
        guard count > 0, let first = bitString.first else { break }
        let bits = first.prefix(count >= first.count ? first.count : count)
        if bits == first {
            bitString.removeFirst()
        } else {
            bitString[0].removeFirst(count)
        }
        result.append(String(bits))
        count -= bits.count
    }
    
    return result
}

func remove(_ k: Int, from bitString: inout [String]) -> String {
    return String(removeBits(k, from: &bitString).flatMap { $0 })
}

func trimPadding(from bitString: inout [String])
{
    if bitString.first?.count ?? 4 < 4 { bitString.removeFirst() }
}

enum PacketType: Int {
    case sum = 0
    case product = 1
    case min = 2
    case max = 3
    case literal = 4
    case greaterThan = 5
    case lessThan = 6
    case equals = 7
}

struct Packet {
    let version: Int
    let type: PacketType
    
    let payload: PacketPayload
    
    func calcValue() -> Int {
        switch payload {
            case .literal(let value): return value
            case .oper(let packets):
                switch type {
                    case .sum:
                        return packets.reduce(0) { $0 + $1.calcValue() }
                    case .product:
                        return packets.reduce(1) { $0 * $1.calcValue() }
                    case .min:
                        return packets.reduce(Int.max) { min($0, $1.calcValue()) }
                    case .max:
                        return packets.reduce(Int.min) { max($0, $1.calcValue()) }
                    case .greaterThan:
                        return packets[0].calcValue() > packets[1].calcValue() ? 1 : 0
                    case .lessThan:
                        return packets[0].calcValue() < packets[1].calcValue() ? 1 : 0
                    case .equals:
                        return packets[0].calcValue() == packets[1].calcValue() ? 1 : 0
                    case .literal:
                        return 0
                }
        }
    }
}

extension Packet: Equatable {}

enum PacketPayload {
    case oper([Packet])
    case literal(Int)
}

extension PacketPayload: Equatable {}

enum LengthType: Int {
    case subPacketBitCount = 0
    case subPacketCount = 1
    
    func numberOfBits() -> Int {
        switch self {
            case .subPacketBitCount: return 15
            case .subPacketCount: return 11
        }
    }
}
