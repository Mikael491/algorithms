import Foundation

//Problem 1.1
func hasUniqueCharacters(string: String) -> Bool {
    
    var unique = Set<Character>()
    
    for x in string.characters {
        guard !unique.contains(x) else { return false }
        unique.insert(x)
    }
    
    return true
}

let name = "mikael"
hasUniqueCharacters(string: name)
