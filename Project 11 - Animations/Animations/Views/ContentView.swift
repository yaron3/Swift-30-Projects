import SwiftUI

struct AnimationItem: Identifiable {
    let id = UUID()
    let title: String
    let description: String
}

struct ContentView: View {
    @State private var items = [
        AnimationItem(title: "2-Color", description: "Simple color transition animation"),
        AnimationItem(title: "Simple 2D Rotation", description: "Continuous rotation animation"),
        AnimationItem(title: "Multicolor", description: "Multiple color transitions"),
        AnimationItem(title: "Multi Point Position", description: "Movement between multiple points"),
        AnimationItem(title: "BezierCurve Position", description: "Movement along a bezier curve"),
        AnimationItem(title: "Color and Frame Change", description: "Combined color and size changes"),
        AnimationItem(title: "View Fade In", description: "Smooth fade transition"),
        AnimationItem(title: "Pop", description: "Scale pop animation")
    ]
    
    @State private var selectedItem: AnimationItem?
    @State private var isShowingDetail = false
    
    var body: some View {
        NavigationView {
            List(items) { item in
                Button(action: {
                    selectedItem = item
                    isShowingDetail = true
                }) {
                    Text(item.title)
                        .foregroundColor(.primary)
                }
            }
            .navigationTitle("Basic Animations")
            .sheet(isPresented: $isShowingDetail) {
                if let item = selectedItem {
                    DetailView(animationItem: item)
                }
            }
        }
    }
}

#Preview {
    ContentView()
} 