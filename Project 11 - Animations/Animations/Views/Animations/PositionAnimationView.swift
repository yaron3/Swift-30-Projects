import SwiftUI

struct PositionAnimationView: AnimationViewProtocol {
    let isAnimating: Bool
    @State private var currentOffset: CGSize = .zero
    
    var body: some View {
        Rectangle()
            .fill(.red)
            .offset(currentOffset)
            .onChange(of: isAnimating) { newValue in
                if newValue {
                    withAnimation(.easeInOut(duration: animationDuration)) {
                        currentOffset = CGSize(width: 0, height: 100)
                    }
                    DispatchQueue.main.asyncAfter(deadline: .now() + animationDuration) {
                        withAnimation(.easeInOut(duration: animationDuration)) {
                            currentOffset = CGSize(width: 0, height: 200)
                        }
                    }
                } else {
                    currentOffset = .zero
                }
            }
    }
} 