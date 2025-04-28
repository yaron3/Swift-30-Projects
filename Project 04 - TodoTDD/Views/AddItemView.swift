import SwiftUI

struct AddItemView: View {
    enum TextFieldTag: Hashable {
        case title
        case description
        case location
    }
    @Environment(\.dismiss) private var dismiss
    @ObservedObject var itemManager: ToDoItemManager
    
    @State private var title = ""
    @State private var itemDescription = ""
    @State private var locationName = ""
    @FocusState private var focusedField: TextFieldTag?
    var body: some View {
            Form {
                Section(header: Text("Item Details")) {
                    TextField("Title", text: $title)
                        .keyboardType(.default)
                        .focused($focusedField, equals: .title)
                        .tag(TextFieldTag.title)
                        .submitLabel(.next)
                        .onSubmit {
                            focusedField = .description
                        }
                    TextField("Description", text: $itemDescription)
                        .focused($focusedField, equals: .description)
                        .tag(TextFieldTag.description)
                        .submitLabel(.next)
                        .onSubmit {
                            focusedField = .location
                        }
                    TextField("Location", text: $locationName)
                        .focused($focusedField, equals: .location)
                        .submitLabel(.done)
                        .tag(TextFieldTag.location)
                    
                    .onSubmit {
                        save()
                        focusedField = nil
                        dismiss()
                        }
                }
            }
            .onAppear() {
                focusedField = .title
            }
            .navigationTitle("Add Item")
            .navigationBarItems(
                leading: Button("Cancel") {
                    dismiss()
                },
                trailing: Button("Save") {
                    save()
                    dismiss()
                }
                .disabled(title.isEmpty)
            )
        
    }
    
    func save() {
        let location = locationName.isEmpty ? nil : Location(name: locationName)
        let item = ToDoItem(
            title: title,
            itemDescription: itemDescription.isEmpty ? nil : itemDescription,
            timeStamp: Date().timeIntervalSince1970,
            location: location
        )
        itemManager.add(item)
        itemManager.save()
    }
}
