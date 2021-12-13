import Foundation

struct Point {
    let x: Int
    let y: Int
}

extension Point: CustomStringConvertible {
    var description: String { "(\(x),\(y))"}
}

extension Point: Equatable {}
