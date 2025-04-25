import SwiftUI

struct PokemonListView: View {
    @StateObject private var api = LibraryAPI.shared
    
    var body: some View {
        NavigationView {
            List(api.pokemons) { pokemon in
                NavigationLink(destination: PokemonDetailView(pokemon: pokemon)) {
                    PokemonRowView(pokemon: pokemon)
                }
            }
            .navigationTitle("Pokédex")
        }
    }
}

struct PokemonRowView: View {
    let pokemon: Pokemon
    @State private var image: Image?
    
    var body: some View {
        HStack {
            if let image = image {
                image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 50, height: 50)
            } else {
                ProgressView()
                    .frame(width: 50, height: 50)
                    .task {
                        do {
                            image = try await LibraryAPI.shared.downloadImage(from: pokemon.pokeImgUrl)
                        } catch {
                            print("Failed to load image: \(error.localizedDescription)")
                        }
                    }
            }
            
            VStack(alignment: .leading) {
                Text(pokemon.name.capitalized)
                    .font(.headline)
                Text(pokemon.formattedId)
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