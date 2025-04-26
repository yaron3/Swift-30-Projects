import SwiftUI

struct RotationAnimationView: AnimationViewProtocol {
    let isAnimating: Bool
    @State private var currentRotation: Double = 0
    
    var body: some View {
        Rectangle()
            .fill(.red)
            .rotationEffect(.degrees(currentRotation))
            .onChange(of: isAnimating) { newValue in
                if newValue {
                    withAnimation(.linear(duration: animationDuration).repeatForever(autoreverses: false)) {
                        currentRotation = 360
                    }
                } else {
                    currentRotation = 0
                }
            }
    }
} 