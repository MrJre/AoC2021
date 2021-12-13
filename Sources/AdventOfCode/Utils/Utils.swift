import Foundation

func file(forDay day: Int) -> String {
    let url = Bundle.module.url(forResource: "Day\(day)Input", withExtension: ".txt")
    return try! String(contentsOf: url!)
}
