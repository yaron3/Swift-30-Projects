import SwiftUI

class ArtistViewModel: ObservableObject {
    @Published var artists: [Artist] = []
    
    init() {
        loadArtists()
    }
    
    private func loadArtists() {
        artists = Artist.artistsFromBundle()
    }
    
    func toggleWorkExpansion(for artist: Artist, work: Work) {
        if let artistIndex = artists.firstIndex(where: { $0.id == artist.id }),
           let workIndex = artists[artistIndex].works.firstIndex(where: { $0.id == work.id }) {
            artists[artistIndex].works[workIndex].isExpanded.toggle()
        }
    }
} 