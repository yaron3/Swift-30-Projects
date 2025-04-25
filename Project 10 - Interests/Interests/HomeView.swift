import SwiftUI

struct HomeView: View {
    @State private var interests = Interest.createInterests()
    @State private var selectedInterest: Interest?
    
    var body: some View {
        ZStack {
            // Background gradient
            LinearGradient(
                gradient: Gradient(colors: [Color.blue.opacity(0.3), Color.purple.opacity(0.3)]),
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .ignoresSafeArea()
            
            VStack(alignment: .leading, spacing: 20) {
                Text("Discover")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding(.horizontal)
                
                Text("Find your interests")
                    .font(.title2)
                    .foregroundColor(.secondary)
                    .padding(.horizontal)
                
                ScrollView(.horizontal, showsIndicators: false) {
                    LazyHStack(spacing: 20) {
                        ForEach(interests) { interest in
                            InterestCard(interest: interest)
                                .frame(width: 300)
                                .onTapGesture {
                                    selectedInterest = interest
                                }
                        }
                    }
                    .padding(.horizontal)
                }
            }
        }
        .sheet(item: $selectedInterest) { interest in
            InterestDetailView(interest: interest)
        }
    }
}



#Preview {
    HomeView()
} 
