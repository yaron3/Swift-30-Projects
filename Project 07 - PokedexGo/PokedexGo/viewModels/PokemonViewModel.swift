import Foundation

class PokemonViewModel: ObservableObject {
    @Published var pokemons: [Pokemon] = []
    
    func fetchPokemons() {
        // Use the predefined pokemons from PokemonConstants
        pokemons = PokedexGo.pokemons
    }
} 