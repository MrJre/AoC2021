import Foundation

func parseDay5Input(from file: String) -> [LineSegment] {

    let lines = file.split(separator: "\n")
    
    var segments: [LineSegment] = []
    
    for line in lines {
        var points: [Point] = []
        let pointComponents = line.components(separatedBy: "->")
        for pointString in pointComponents {
            let point = pointString.split(separator: ",").map { $0.trimmingCharacters(in: .whitespaces)}.compactMap { Int($0) }
            if let x = point.first, let y = point.last {
                points.append(Point(x: x, y: y))
            }
        }
        if let pointA = points.first, let pointB = points.last {
            if pointA.x > pointB.x || pointA.y > pointB.y {
                segments.append(LineSegment(pointA: pointB, pointB: pointA))
            } else {
                segments.append(LineSegment(pointA: pointA, pointB: pointB))
            }
        }
    }
    
    return segments
}
