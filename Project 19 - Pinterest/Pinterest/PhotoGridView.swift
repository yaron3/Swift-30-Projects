import SwiftUI

struct PhotoGridView: View {
    let photos = Photo.allPhotos()
    let columns = [
        GridItem(.adaptive(minimum: 160), spacing: 16),
        GridItem(.adaptive(minimum: 80), spacing: 8)
    ]
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns, spacing: 16) {
                ForEach(photos) { photo in
                    PhotoView(photo: photo)
                }
            }
            .padding(16)
        }
        .background(
            Image("Pattern")
                .resizable()
                .ignoresSafeArea()
        )
    }
} 
