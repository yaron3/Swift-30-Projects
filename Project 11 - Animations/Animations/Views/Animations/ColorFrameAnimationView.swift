import SwiftUI

struct ColorFrameAnimationView: AnimationViewProtocol {
    let isAnimating: Bool
    @State private var currentColor = Color.red
    @State private var currentScale: CGFloat = 1.0
    
    var body: some View {
        Rectangle()
            .fill(currentColor)
            .scaleEffect(currentScale)
            .onChange(of: isAnimating) { newValue in
                if newValue {
                    withAnimation(.easeInOut(duration: animationDuration)) {
                        currentColor = .orange
                        currentScale = 1.2
                    }
                    DispatchQueue.main.asyncAfter(deadline: .now() + animationDuration) {
                        withAnimation(.easeInOut(duration: animationDuration)) {
                            currentColor = .yellow
                            currentScale = 0.8
                        }
                    }
                    DispatchQueue.main.asyncAfter(deadline: .now() + animationDuration * 2) {
                        withAnimation(.easeInOut(duration: animationDuration)) {
                            currentColor = .green
                            currentScale = 1.0
                        }
                    }
                } else {
                    currentColor = .red
                    currentScale = 1.0
                }
            }
    }
} 