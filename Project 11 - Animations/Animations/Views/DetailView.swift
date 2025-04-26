import SwiftUI

struct DetailView: View {
    let animationItem: AnimationItem
    @Environment(\.dismiss) private var dismiss
    @State private var isAnimating = false
    
    var body: some View {
        VStack {
            Text(animationItem.title)
                .font(.headline)
                .padding(.top,3)
            Text(animationItem.description)
                .font(.subheadline)
            Spacer()
            animationView
                .frame(width: 100, height: 100)
                .onAppear {
                    isAnimating = true
                }
            Spacer()
            Button("Animate") {
                withAnimation {
                    isAnimating.toggle()
                }
            }
            .buttonStyle(.borderedProminent)
            .padding()
        }
        .navigationTitle(animationItem.title)
        .navigationBarTitleDisplayMode(.inline)
    }
    
    @ViewBuilder
    private var animationView: some View {
        switch animationItem.title {
        case "2-Color":
            ColorAnimationView(isAnimating: isAnimating)
        case "Simple 2D Rotation":
            RotationAnimationView(isAnimating: isAnimating)
        case "Multicolor":
            MultiColorAnimationView(isAnimating: isAnimating)
        case "Multi Point Position":
            PositionAnimationView(isAnimating: isAnimating)
        case "BezierCurve Position":
            BezierCurveAnimationView(isAnimating: isAnimating)
        case "Color and Frame Change":
            ColorFrameAnimationView(isAnimating: isAnimating)
        case "View Fade In":
            FadeAnimationView(isAnimating: isAnimating)
        case "Pop":
            PopAnimationView(isAnimating: isAnimating)
        default:
            EmptyView()
        }
    }
}

#Preview {
    NavigationView {
        DetailView(animationItem: AnimationItem(title: "2-Color", description: "Simple color transition animation"))
    }
} 
