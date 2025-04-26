import SwiftUI

struct PhotoView: View {
    let photo: Photo
    
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            photo.image
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(maxWidth: .infinity)
                .clipped()
            
            VStack(alignment: .leading, spacing: 4) {
                Text(photo.caption)
                    .font(.headline)
                    .foregroundColor(.primary)
                
                Text(photo.comment)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                    .lineLimit(3)
            }
            .padding(.horizontal, 8)
            .padding(.vertical, 4)
        }
        .background(Color.white)
        .cornerRadius(8)
        .shadow(radius: 2)
    }
} 