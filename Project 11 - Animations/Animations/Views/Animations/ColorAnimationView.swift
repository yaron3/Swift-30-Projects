import SwiftUI

struct ColorAnimationView: AnimationViewProtocol {
    let isAnimating: Bool
    @State private var currentColor = Color.red
    
    var body: some View {
        Rectangle()
            .fill(currentColor)
            .onChange(of: isAnimating) { oldValue, newValue in
                if newValue != oldValue {
                    withAnimation(.easeInOut(duration: animationDuration)) {
                        if currentColor == .red {
                            currentColor = .orange
                        } else if currentColor == .orange {
                            currentColor = .yellow
                        } else if currentColor == .yellow {
                            currentColor = .green
                        } else {
                            currentColor = .red
                        }
                    }
                }
            }
    }
}
#Preview {
    ColorAnimationView(isAnimating: true)
        .frame(width: 200, height: 200)
}
