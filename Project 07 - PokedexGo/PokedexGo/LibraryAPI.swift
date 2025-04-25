import SwiftUI

@MainActor
final class LibraryAPI: ObservableObject {
    static let shared = LibraryAPI()
    private let persistencyManager = PersistencyManager.shared
    
    @Published private(set) var pokemons: [Pokemon] = []
    
    private init() {
        loadPokemons()
    }
    
    private func loadPokemons() {
        pokemons = pokemons
    }
    
    func downloadImage(from urlString: String) async throws -> Image {
        guard let url = URL(string: urlString) else {
            throw APIError.invalidURL
        }
        
        let filename = url.lastPathComponent
        
        // Check cache first
        if let cachedImage = persistencyManager.getImage(filename) {
            return Image(uiImage: cachedImage)
        }
        
        // Download and cache the image
        let (data, _) = try await URLSession.shared.data(from: url)
        guard let uiImage = UIImage(data: data) else {
            throw APIError.invalidImageData
        }
        
        // Save to cache
        persistencyManager.saveImage(uiImage, filename: filename)
        
        return Image(uiImage: uiImage)
    }
}

enum APIError: LocalizedError {
    case invalidURL
    case invalidImageData
    
    var errorDescription: String? {
        switch self {
        case .invalidURL:
            return "Invalid URL provided"
        case .invalidImageData:
            return "Could not create image from downloaded data"
        }
    }
}
