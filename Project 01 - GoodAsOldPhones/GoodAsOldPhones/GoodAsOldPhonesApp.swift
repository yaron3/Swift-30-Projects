import SwiftUI

@main
struct GoodAsOldPhonesApp: App {
    var body: some Scene {
        WindowGroup {
            TabView {
                ProductListView()
                    .tabItem {
                        Label("Products", systemImage: "list.bullet")
                    }
                
                ContactView()
                    .tabItem {
                        Label("Us", systemImage: "person.2")
                    }
            }
        }
        
    }
} 
