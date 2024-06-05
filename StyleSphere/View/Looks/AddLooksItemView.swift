import SwiftUI
import SwiftData
import PhotosUI

struct CreateLookView: View {
    @Environment(\.modelContext) private var modelContext
    @Environment(\.dismiss) var dismiss

    @State private var lookName: String = ""
    @Query var WardrobeItems: [WardrobeItem]
    @State private var selectedItems: Set<WardrobeItem> = []

    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Name your look")) {
                    TextField("Look Name", text: $lookName)
                }
                Section(header: Text("Select Wardrobe Items")) {
                    List(WardrobeItems, id: \.self) { item in
                        MultipleSelectionRow(title: item.name, isSelected: selectedItems.contains(item)) {
                            if selectedItems.contains(item) {
                                selectedItems.remove(item)
                            } else {
                                selectedItems.insert(item)
                            }
                        }
                    }
                }
                Section {
                    Button("Save Look") {
                        let newLook = LooksItem(name: lookName, items: Array(selectedItems))
                        modelContext.insert(newLook)
                        try? modelContext.save()
                        dismiss()
                    }
                }
            }
            .navigationTitle("Create New Look")
            .navigationBarItems(trailing: Button("Dismiss") {
                dismiss()
            })
        }
    }
}

struct MultipleSelectionRow: View {
    var title: String
    var isSelected: Bool
    var action: () -> Void

    var body: some View {
        HStack {
            Text(title)
            Spacer()
            if isSelected {
                Image(systemName: "checkmark")
            }
        }
        .contentShape(Rectangle())
        .onTapGesture(perform: action)
    }
}
