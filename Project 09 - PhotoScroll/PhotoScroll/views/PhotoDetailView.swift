import SwiftUI

struct PhotoDetailView: View {
    let photoName: String
    @State private var scale: CGFloat = 1.0
    @State private var lastScale: CGFloat = 1.0
    @State private var offset: CGSize = .zero
    @State private var lastOffset: CGSize = .zero
    @State private var showingComments = false
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                Color.black.opacity(0.1).edgesIgnoringSafeArea(.all)
                
                Image(photoName)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .scaleEffect(scale)
                    .offset(offset)
                    .gesture(
                        SimultaneousGesture(
                            MagnificationGesture()
                                .onChanged { value in
                                    let delta = value / lastScale
                                    lastScale = value
                                    scale = min(max(scale * delta, 1), 4)
                                }
                                .onEnded { _ in
                                    lastScale = 1.0
                                },
                            DragGesture()
                                .onChanged { value in
                                    offset = CGSize(
                                        width: lastOffset.width + value.translation.width,
                                        height: lastOffset.height + value.translation.height
                                    )
                                }
                                .onEnded { _ in
                                    lastOffset = offset
                                }
                        )
                    )
                    .onTapGesture(count: 2) {
                        withAnimation {
                            scale = scale > 1 ? 1 : 2
                            offset = .zero
                            lastOffset = .zero
                        }
                    }
            }
        }
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button(action: { showingComments = true }) {
                    Image(systemName: "message")
                }
            }
        }
        .sheet(isPresented: $showingComments) {
            PhotoCommentsView(photoName: photoName)
        }
    }
}

struct PhotoCommentsView: View {
    let photoName: String
    @Environment(\.dismiss) private var dismiss
    @State private var comment = ""
    
    var body: some View {
        NavigationStack {
            VStack {
                Image(photoName)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: 200)
                
                TextField("Add a comment...", text: $comment)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                
                Spacer()
            }
            .navigationTitle("Comments")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Done") {
                        dismiss()
                    }
                }
            }
        }
    }
}

#Preview {
    NavigationStack {
        PhotoDetailView(photoName: "photo1")
    }
} 