import SwiftUI

struct DetailView: View {
    let candy: Candy
    
    var body: some View {
        VStack(spacing: 20) {
            Image(candy.name)
                .resizable()
                .scaledToFit()
                .frame(maxHeight: 300)
                .cornerRadius(10)
                .shadow(radius: 5)
            
            VStack(alignment: .leading, spacing: 10) {
                Text(candy.name)
                    .font(.title)
                    .bold()
                
                Text("Category: \(candy.category)")
                    .font(.headline)
                    .foregroundColor(.secondary)
            }
            .padding()
            
            Spacer()
        }
        .padding()
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    NavigationStack {
        DetailView(candy: Candy.sampleCandies[0])
    }
} 