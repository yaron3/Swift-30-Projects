import SwiftUI

struct MultiColorAnimationView: AnimationViewProtocol {
    let isAnimating: Bool
    @State private var currentColor = Color.red
    
    var body: some View {
        Rectangle()
            .fill(currentColor)
            .onChange(of: isAnimating) { _, newValue in
                if newValue {
                    withAnimation(.easeInOut(duration: animationDuration)) {
                        currentColor = .green
                    }
                    DispatchQueue.main.asyncAfter(deadline: .now() + animationDuration) {
                        withAnimation(.easeInOut(duration: animationDuration)) {
                            currentColor = .blue
                        }
                    }
                } else {
                    currentColor = .red
                }
            }
    }
} 