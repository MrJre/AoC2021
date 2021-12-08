import Foundation

enum Edge: String {
    case a
    case b
    case c
    case d
    case e
    case f
    case g
}

func parseDay8Input(from file: String) -> [([Set<Edge>], [Set<Edge>])]
{
    let result: [([Set<Edge>], [Set<Edge>])] = file.split(separator: "\n").map {
        let line = $0.split(separator: "|")
        let signal = line[0].split(separator: " ").map { Set(String($0).map { Edge(rawValue: String($0))!}) }
        let output = line[1].split(separator: " ").map { Set(String($0).map { Edge(rawValue: String($0))!}) }
        return (signal, output)
    }
    return result
}
