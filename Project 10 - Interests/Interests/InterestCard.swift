import SwiftUI

struct InterestCard: View {
    let interest: Interest
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Image(interest.featuredImage)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(height: 200)
                .clipped()
            
            VStack(alignment: .leading, spacing: 4) {
                Text(interest.title)
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundColor(.primary)
                
                Text(interest.description)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                    .lineLimit(3)
                
                HStack {
                    Label("\(interest.numberOfMembers)", systemImage: "person.2")
                    Spacer()
                    Label("\(interest.numberOfPosts)", systemImage: "doc.text")
                }
                .font(.caption)
                .foregroundColor(.secondary)
            }
            .padding(.horizontal, 12)
            .padding(.bottom, 12)
        }
        .background(Color(.systemBackground))
        .cornerRadius(12)
        .shadow(radius: 5)
    }
}

#Preview {
    InterestCard(interest: Interest.createInterests()[0])
        .padding()
} 