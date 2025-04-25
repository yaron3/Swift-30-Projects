import SwiftUI

struct ContentView: View {
    private let columns = [
        GridItem(.adaptive(minimum: 100), spacing: 10)
    ]
    
    private let photos = ["photo1", "photo2", "photo3", "photo4", "photo5"]
    
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVGrid(columns: columns, spacing: 10) {
                    ForEach(photos.indices, id: \.self) { index in
                        NavigationLink(destination: PhotoDetailView(photoName: photos[index])) {
                            PhotoThumbnailView(photoName: photos[index])
                        }
                    }
                }
                .padding()
            }
            .navigationTitle("Photo Gallery")
        }
    }
}

struct PhotoThumbnailView: View {
    let photoName: String
    
    var body: some View {
        Image(photoName)
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: 100, height: 100)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .shadow(radius: 3)
    }
}

#Preview {
    ContentView()
} 