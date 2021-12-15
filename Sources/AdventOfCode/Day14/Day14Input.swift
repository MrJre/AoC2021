import Foundation

func parseDay14Input(from file: String) -> (String, [String: String])
{
    let lines = file.split(separator: "\n", omittingEmptySubsequences: false).map(String.init)
    let polymerAndMappings = lines.split(separator: "")
    
    let polymer = String(polymerAndMappings[0].flatMap { $0 })
    let mappingLines = polymerAndMappings[1]
    
    var mappings: [String: String] = [:]
    mappingLines.forEach {
        let components = $0.components(separatedBy: " -> ")
        mappings[components[0]] = components[1]
    }
    
    return (polymer, mappings)
}


    
