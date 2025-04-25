import SwiftUI

struct PokemonListView: View {
    @StateObject private var viewModel = PokemonViewModel()
    
    var body: some View {
        NavigationView {
            List(viewModel.pokemons) { pokemon in
                NavigationLink(destination: PokemonDetailView(pokemon: pokemon)) {
                    PokemonRowView(pokemon: pokemon)
                }
            }
            .navigationTitle("Pokédex")
            .onAppear {
                viewModel.fetchPokemons()
            }
        }
    }
}

struct PokemonRowView: View {
    let pokemon: Pokemon
    
    var body: some View {
        HStack {
            AsyncImage(url: URL(string: pokemon.pokeImgUrl)) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            } placeholder: {
                ProgressView()
            }
            .frame(width: 50, height: 50)
            
            VStack(alignment: .leading) {
                Text(pokemon.name.capitalized)
                    .font(.headline)
                Text("#\(String(format: "%03d", pokemon.id))")
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
        }
        .padding(.vertical, 8)
    }
}

#Preview {
    PokemonListView()
} 
