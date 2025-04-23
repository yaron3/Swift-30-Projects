import SwiftUI

struct ProductDetailView: View {
    let product: Product
    
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                Image(product.fullscreenImageName)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(maxWidth: .infinity, maxHeight: 645)
                    .ignoresSafeArea(edges: .top)
                Text(product.name)
                    .font(.title)
                    .fontWeight(.bold)
                
                Button(action: {
                    print("Add to cart successfully")
                }) {
                    Image("button-addtocart")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 158, height: 41)
                }
            }
            .padding()
        }
        .navigationBarTitleDisplayMode(.inline)
        .ignoresSafeArea(edges: .top)
    }
} 

#Preview{
    ProductDetailView(product: Product(name: "1907 Wall Set", cellImageName: "image-cell1", fullscreenImageName: "phone-fullscreen1"))
}
