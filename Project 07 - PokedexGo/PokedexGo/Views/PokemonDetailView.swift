import SwiftUI

struct PokemonDetailView: View {
    let pokemon: Pokemon
    @State private var image: Image?
    
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                if let image = image {
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 200, height: 200)
                } else {
                    ProgressView()
                        .frame(width: 200, height: 200)
                        .task {
                            do {
                                image = try await LibraryAPI.shared.downloadImage(from: pokemon.pokeImgUrl)
                            } catch {
                                print("Failed to load image: \(error.localizedDescription)")
                            }
                        }
                }
                
                VStack(alignment: .leading, spacing: 10) {
                    Text(pokemon.name.capitalized)
                        .font(.largeTitle)
                        .bold()
                    
                    Text(pokemon.formattedId)
                        .font(.title2)
                        .foregroundColor(.gray)
                    
                    Text(pokemon.detailInfo)
                        .font(.body)
                        .padding(.vertical)
                    
                    Divider()
                    
                    Text("Types:")
                        .font(.headline)
                    HStack {
                        ForEach(pokemon.type, id: \.self) { type in
                            Text(type.rawValue.capitalized)
                                .padding(.horizontal, 10)
                                .padding(.vertical, 5)
                                .background(Color.blue.opacity(0.2))
                                .cornerRadius(10)
                        }
                    }
                    
                    Divider()
                    
                    Text("Stats:")
                        .font(.headline)
                    ForEach(pokemon.stats) { stat in
                        HStack {
                            Text(stat.name.capitalized)
                                .frame(width: 100, alignment: .leading)
                            ProgressView(value: Double(stat.value), total: 255)
                                .frame(height: 20)
                            Text("\(stat.value)")
                                .frame(width: 40, alignment: .trailing)
                        }
                    }
                    
                    Divider()
                    
                    Text("Weaknesses:")
                        .font(.headline)
                    HStack {
                        ForEach(pokemon.weak, id: \.self) { type in
                            Text(type.rawValue.capitalized)
                                .padding(.horizontal, 10)
                                .padding(.vertical, 5)
                                .background(Color.red.opacity(0.2))
                                .cornerRadius(10)
                        }
                    }
                }
                .padding()
            }
        }
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    NavigationView {
        PokemonDetailView(pokemon: Pokemon(
            id: 1,
            name: "bulbasaur",
            detailInfo: "A strange seed was planted on its back at birth. The plant sprouts and grows with this Pokémon.",
            type: [.grass, .poison],
            weak: [.fire, .ice, .flying, .psychic],
            pokeImgUrl: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/1.png",
            stats: [
                Stat(name: "hp", value: 45),
                Stat(name: "attack", value: 49),
                Stat(name: "defense", value: 49),
                Stat(name: "special-attack", value: 65),
                Stat(name: "special-defense", value: 65),
                Stat(name: "speed", value: 45)
            ]
        ))
    }
} 