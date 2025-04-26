import SwiftUI

struct PopAnimationView: AnimationViewProtocol {
    let isAnimating: Bool
    @State private var currentScale: CGFloat = 1.0
    
    var body: some View {
        Rectangle()
            .fill(.red)
            .scaleEffect(currentScale)
            .onChange(of: isAnimating) { newValue in
                if newValue {
                    withAnimation(.spring(response: 0.3, dampingFraction: 0.5)) {
                        currentScale = 1.2
                    }
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                        withAnimation(.spring(response: 0.3, dampingFraction: 0.5)) {
                            currentScale = 1.0
                        }
                    }
                } else {
                    currentScale = 1.0
                }
            }
    }
} 