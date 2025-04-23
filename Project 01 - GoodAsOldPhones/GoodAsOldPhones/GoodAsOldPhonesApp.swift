import SwiftUI

@main
struct GoodAsOldPhonesApp: App {
    var body: some Scene {
        WindowGroup {
            TabView {
                NavigationStack {
                    ProductListView()
                        .navigationBarTitleDisplayMode(.inline)
                }
                .tabItem {
                    Label("Products", systemImage: "list.bullet")
                }
                
                NavigationStack {
                    ContactView()
                        .navigationBarTitleDisplayMode(.inline)
                }
                .tabItem {
                    Label("Us", systemImage: "person.2")
                }
            }
            .ignoresSafeArea()
        }
    }
}

#Preview {
    TabView {
        NavigationStack {
            ProductListView()
                .navigationBarTitleDisplayMode(.inline)
        }
        .tabItem {
            Label("Products", systemImage: "list.bullet")
        }
        
        NavigationStack {
            ContactView()
                .navigationBarTitleDisplayMode(.inline)
        }
        .tabItem {
            Label("Us", systemImage: "person.2")
        }
    }
    .ignoresSafeArea()

}
