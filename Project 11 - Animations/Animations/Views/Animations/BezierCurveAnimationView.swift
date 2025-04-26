import SwiftUI

struct BezierCurveAnimationView: AnimationViewProtocol {
    let isAnimating: Bool
    @State private var currentOffset: CGSize = .zero
    
    var body: some View {
        Circle()
            .fill(.red)
            .offset(currentOffset)
            .onChange(of: isAnimating) { _, newValue in
                withAnimation(.easeInOut(duration: animationDuration)) {
                    currentOffset = newValue ? CGSize(width: 100, height: -100): .zero

                }
            }
    }
} 

#Preview {
    BezierCurveAnimationView(isAnimating: true)
        .frame(width: 200, height: 200)
}
