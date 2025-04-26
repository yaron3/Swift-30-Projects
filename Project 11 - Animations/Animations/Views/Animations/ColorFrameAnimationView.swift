import SwiftUI

struct ColorFrameAnimationView: AnimationViewProtocol {
    let isAnimating: Bool
    @State private var currentColor = Color.red
    @State private var currentScale: CGFloat = 1.0
    
    var body: some View {
        Rectangle()
            .fill(currentColor)
            .scaleEffect(currentScale)
            .onChange(of: isAnimating) { _, newValue in
                withAnimation(.easeInOut(duration: animationDuration)) {
                    currentColor = newValue ? .orange: .red
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
                        currentColor = newValue ? .green: .purple
                        currentScale = 1.0
                    }
                }
                
            }
    }
} 