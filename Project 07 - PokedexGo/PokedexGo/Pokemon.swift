import Foundation

enum PokeType: String, CaseIterable, Identifiable {
    case normal
    case fire
    case water
    case electric
    case grass
    case ice
    case fighting
    case poison
    case ground
    case flying
    case psychic
    case bug
    case rock
    case ghost
    case dragon
    case dark
    case steel
    case fairy
    
    var id: String { rawValue }
}

struct Stat: Identifiable {
    let id = UUID()
    let name: String
    let value: Int
}

struct Pokemon: Identifiable {
    let id: Int
    let name: String
    let detailInfo: String
    let type: [PokeType]
    let weak: [PokeType]
    let pokeImgUrl: String
    let stats: [Stat]
    
    var formattedId: String {
        String(format: "#%03d", id)
    }
}
