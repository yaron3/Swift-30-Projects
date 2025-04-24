import SwiftUI

struct ArtistListView: View {
    @StateObject private var viewModel = ArtistViewModel()
    
    var body: some View {
        NavigationView {
            List(viewModel.artists) { artist in
                NavigationLink(destination: ArtistDetailView(artist: artist)) {
                    ArtistRowView(artist: artist)
                }
            }
            .navigationTitle("Artists")
        }
    }
}

struct ArtistRowView: View {
    let artist: Artist
    
    var body: some View {
        HStack {
            Image(artist.image)
                .resizable()
                .scaledToFill()
                .frame(width: 60, height: 60)
                .clipShape(Circle())
            
            VStack(alignment: .leading) {
                Text(artist.name)
                    .font(.headline)
                Text(artist.bio)
                    .font(.subheadline)
                    .lineLimit(2)
                    .foregroundColor(.secondary)
            }
        }
        .padding(.vertical, 8)
    }
}

#Preview {
    ArtistListView()
} 