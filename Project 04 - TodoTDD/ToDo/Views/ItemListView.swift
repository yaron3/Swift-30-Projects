import SwiftUI

struct ItemListView: View {
    @StateObject private var itemManager = ToDoItemManager()
    @State private var showingAddItem = false
    
    var body: some View {
        List {
            Section(header: Text("To Do")) {
                ForEach(0..<itemManager.toDoCount, id: \.self) { index in
                    ItemRowView(item: itemManager.item(at: index))
                        .swipeActions {
                            Button(role: .destructive) {
                                itemManager.checkItem(at: index)
                            } label: {
                                Label("Complete", systemImage: "checkmark.circle")
                            }
                        }
                }
            }
            
            Section(header: Text("Done")) {
                ForEach(0..<itemManager.doneCount, id: \.self) { index in
                    ItemRowView(item: itemManager.doneItem(at: index))
                        .swipeActions {
                            Button {
                                itemManager.uncheckItem(at: index)
                            } label: {
                                Label("Uncomplete", systemImage: "arrow.uturn.backward")
                            }
                        }
                }
            }
        }
        .navigationTitle("To Do List")
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button {
                    showingAddItem = true
                } label: {
                    Image(systemName: "plus")
                }
            }
        }
        .sheet(isPresented: $showingAddItem) {
            AddItemView(itemManager: itemManager)
        }
    }
}

struct ItemRowView: View {
    let item: ToDoItem
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(item.title)
                .font(.headline)
            if let description = item.itemDescription {
                Text(description)
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
            if let location = item.location {
                Text(location.name)
                    .font(.caption)
                    .foregroundColor(.blue)
            }
        }
    }
} 