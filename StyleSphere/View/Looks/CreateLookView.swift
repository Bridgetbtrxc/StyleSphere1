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
                        MultipleSelectionRow(item: item, isSelected: selectedItems.contains(item)) {
                            withAnimation {
                                if selectedItems.contains(item) {
                                    selectedItems.remove(item)
                                } else {
                                    selectedItems.insert(item)
                                }
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
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct MultipleSelectionRow: View {
    var item: WardrobeItem
    var isSelected: Bool
    var action: () -> Void

    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(item.name)
                    .font(.headline)
                HStack {
                    HStack {
                        Image(systemName: "tag")
                        Text(item.category)
                    }
                    .font(.caption)
                    .foregroundColor(.secondary)
                    HStack {
                        Image(systemName: "paintpalette")
                        Text(item.color)
                    }
                    .font(.caption)
                    .foregroundColor(.secondary)
                }
            }
            Spacer()
            if isSelected {
                Image(systemName: "checkmark")
            }
        }
        .contentShape(Rectangle())
        .onTapGesture(perform: action)
    }
}
