import SwiftUI

struct NewsItem: Identifiable {
    let id = UUID()
    let title: String
    let description: String
    let pubDate: String
}

struct NewsItemView: View {
    let item: NewsItem
    @State private var isExpanded = false
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text(item.title)
                .font(.headline)
                .foregroundColor(.primary)
            
            Text(item.description)
                .font(.body)
                .foregroundColor(.secondary)
                .lineLimit(isExpanded ? nil : 3)
                .animation(.easeInOut, value: isExpanded)
            
            Text(item.pubDate)
                .font(.caption)
                .foregroundColor(.gray)
        }
        .padding()
        .background(Color(.systemBackground))
        .cornerRadius(12)
        .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 2)
        .onTapGesture {
            withAnimation {
                isExpanded.toggle()
            }
        }
    }
} 