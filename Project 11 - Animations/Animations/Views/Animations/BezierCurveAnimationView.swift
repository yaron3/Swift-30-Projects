import SwiftUI

struct BezierCurveAnimationView: AnimationViewProtocol {
    var isAnimating: Bool
    @State private var currentOffset: CGSize = .zero
    
    var body: some View {
        Circle()
            .fill(.red)
            .offset(currentOffset)
            .onChange(of: isAnimating) { newValue in
                if newValue {
                    withAnimation(.easeInOut(duration: animationDuration)) {
                        currentOffset = CGSize(width: 100, height: -100)
                    }
                } else {
                    currentOffset = .zero
                }
            }
    }
} 

#Preview {
    BezierCurveAnimationView(isAnimating: true)
        .frame(width: 200, height: 200)
}
