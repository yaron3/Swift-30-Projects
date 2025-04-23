import SwiftUI

struct AddItemView: View {
    @Environment(\.dismiss) private var dismiss
    @ObservedObject var itemManager: ToDoItemManager
    
    @State private var title = ""
    @State private var itemDescription = ""
    @State private var locationName = ""
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Item Details")) {
                    TextField("Title", text: $title)
                    TextField("Description", text: $itemDescription)
                    TextField("Location", text: $locationName)
                }
            }
            .navigationTitle("Add Item")
            .navigationBarItems(
                leading: Button("Cancel") {
                    dismiss()
                },
                trailing: Button("Save") {
                    let location = locationName.isEmpty ? nil : Location(name: locationName)
                    let item = ToDoItem(
                        title: title,
                        itemDescription: itemDescription.isEmpty ? nil : itemDescription,
                        timeStamp: Date().timeIntervalSince1970,
                        location: location
                    )
                    itemManager.add(item)
                    dismiss()
                }
                .disabled(title.isEmpty)
            )
        }
    }
} 