import SwiftUI

struct ProductListView: View {
    let products = [
        Product(name: "1907 Wall Set", cellImageName: "image-cell1", fullscreenImageName: "phone-fullscreen1"),
        Product(name: "1921 Dial Phone", cellImageName: "image-cell2", fullscreenImageName: "phone-fullscreen2"),
        Product(name: "1937 Desk Set", cellImageName: "image-cell3", fullscreenImageName: "phone-fullscreen3"),
        Product(name: "1984 Moto Portable", cellImageName: "image-cell4", fullscreenImageName: "phone-fullscreen4")
    ]
    
    var body: some View {
        NavigationStack {
            List(products) { product in
                NavigationLink(destination: ProductDetailView(product: product)) {
                    ProductRowView(product: product)
                }
            }
            .navigationTitle("Products")
        }
        .ignoresSafeArea(edges: .top)
    }
}

struct ProductRowView: View {
    let product: Product
    
    var body: some View {
        HStack {
            Image(product.cellImageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 60, height: 60)
            
            Text(product.name)
                .font(.headline)
        }
        .padding(.vertical, 8)
    }
} 


#Preview{
    ProductListView()
}
