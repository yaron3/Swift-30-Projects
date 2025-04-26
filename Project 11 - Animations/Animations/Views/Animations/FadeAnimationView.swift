import SwiftUI

struct FadeAnimationView: AnimationViewProtocol {
    let isAnimating: Bool
    @State private var showSecondImage = false
    
    var body: some View {
        ZStack {
            if showSecondImage {
                Image(systemName: "star.fill")
                    .resizable()
                    .foregroundColor(.yellow)
                    .transition(.opacity)
            } else {
                Image(systemName: "heart.fill")
                    .resizable()
                    .foregroundColor(.red)
                    .transition(.opacity)
            }
        }
        .onChange(of: isAnimating) { newValue in
            if newValue {
                withAnimation(.easeInOut(duration: animationDuration)) {
                    showSecondImage.toggle()
                }
            } else {
                showSecondImage = false
            }
        }
    }
} 