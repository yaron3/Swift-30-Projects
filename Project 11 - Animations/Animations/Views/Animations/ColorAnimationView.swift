import SwiftUI

struct ColorAnimationView: AnimationViewProtocol {
    let isAnimating: Bool
    @State private var currentColor = Color.red
    
    var body: some View {
        Rectangle()
            .fill(currentColor)
            .onChange(of: isAnimating) { newValue in
                if newValue {
                    withAnimation(.easeInOut(duration: animationDuration)) {
                        currentColor = .green
                    }
                } else {
                    withAnimation(.easeInOut(duration: animationDuration)) {
                        currentColor = .red
                    }
                }
            }
    }
} 
#Preview {
    ColorAnimationView(isAnimating: true)
        .frame(width: 200, height: 200)
}
