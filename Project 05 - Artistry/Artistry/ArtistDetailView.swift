import SwiftUI

struct ArtistDetailView: View {
    @EnvironmentObject private var viewModel: ArtistViewModel
    let artist: Artist
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                // Artist header
                HStack(spacing: 16) {
                    Image(artist.image)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 100, height: 100)
                        .clipShape(Circle())
                    
                    VStack(alignment: .leading) {
                        Text(artist.name)
                            .font(.title)
                            .fontWeight(.bold)
                        Text(artist.bio)
                            .font(.body)
                            .foregroundColor(.secondary)
                    }
                }
                .padding(.horizontal)
                
                // Works
                Text("Works")
                    .font(.title2)
                    .fontWeight(.bold)
                    .padding(.horizontal)
                
                LazyVStack(spacing: 16) {
                    ForEach(artist.works) { work in
                        WorkCardView(work: work)
                            .onTapGesture {
                                viewModel.toggleWorkExpansion(for: artist, work: work)
                            }
                    }
                }
                .padding(.horizontal)
            }
            .padding(.vertical)
        }
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct WorkCardView: View {
    let work: Work
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
          Image(work.image)
                .resizable()
                .scaledToFit()
                .frame(maxWidth: .infinity)
                .cornerRadius(12)
            
            Text(work.title)
                .font(.headline)
            
            if work.isExpanded {
                Text(work.info)
                    .font(.body)
                    .foregroundColor(.secondary)
            }
        }
        .padding()
        .background(Color(.systemBackground))
        .cornerRadius(12)
        .shadow(radius: 5)
    }
}

#Preview {
    NavigationView {
        ArtistDetailView(artist: Artist.artistsFromBundle().first!)
            .environmentObject(ArtistViewModel())
    }
} 
