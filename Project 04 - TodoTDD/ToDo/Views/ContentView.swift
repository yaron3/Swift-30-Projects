import SwiftUI

struct ContentView: View {
    @StateObject private var itemManager = ToDoItemManager()
    @Environment(\.scenePhase) private var scenePhase
    
    var body: some View {
        NavigationStack {
            ItemListView()
                .environmentObject(itemManager)
                .onChange(of: scenePhase) { phase in
                    if phase == .inactive {
                        itemManager.save()
                    }
                }
        }
        .ignoresSafeArea(.keyboard)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

#Preview {
    ContentView()
} 