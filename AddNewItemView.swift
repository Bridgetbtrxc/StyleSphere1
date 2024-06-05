//
//  AddNewItemView.swift
//  StyleSphere
//
//  Created by MacBook Pro on 03/06/24.
//

import SwiftUI
import PhotosUI
import SwiftData

struct AddNewItemView: View {
    @Environment(\.modelContext) var modelContext
    @Environment(\.dismiss) var dismiss
    
    @State private var item = WardrobeItem()
    
    @State private var name: String = ""
    @State private var category: String = "Celana"
    @State private var color: String = ""
    @State var selectedPhoto: PhotosPickerItem?
    @State var selectedPhotoData: Data?
    
    let categories = ["Celana", "Rok", "Baju", "Kemeja", "Kaos", "Sandal", "Sepatu"]
    
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Clothing Details")) {
                    TextField("Name", text: $name)
                    Picker("Category", selection: $category) {
                        ForEach(categories, id: \.self) {
                            Text($0)
                        }
                    }
                    .pickerStyle(WheelPickerStyle())
                    TextField("Color", text: $color)
                }
                Section(header: Text("Import your clothing")){
                    
                    if let imageData =   item.image,
                       let uiImage = UIImage(data: imageData){
                        Image(uiImage: uiImage)
                            .resizable()
                            .scaledToFill()
                            .frame(maxWidth:.infinity, maxHeight: 300 )
                        
                    }
                    
                    PhotosPicker(
                        selection: $selectedPhoto,
                        matching:.images,
                        photoLibrary: .shared()
                    ){
                        Label("Add Image",systemImage: "photo")
                    }
                    
                    if item.image != nil {
                        Button(role: .destructive){
                            withAnimation{
                                selectedPhoto = nil
                                item.image = nil
                            }
                        } label: {
                            Label("Remove Image", systemImage: "xmark")
                                .foregroundStyle(.red)
                        }
                    }
                }
                
                Section {
                    Button("Save") {
                        saveNewItem()
                        dismiss()
                    }
                }
            }
            .navigationTitle("Add New Item")
            .navigationBarItems(trailing: Button("Dismiss") {
                dismiss()
            })
            .task(id: selectedPhoto){
                if let data = try? await selectedPhoto?.loadTransferable(type: Data.self){
                    selectedPhotoData = data
                    item.image = data  // Ensure the item's image is updated here
                }
            }
        }
    }
    
    private func saveNewItem() {
        item.name = name
        item.category = category
        item.color = color
        item.image = selectedPhotoData
        
        
            modelContext.insert(item)
        
        
        do {
            try modelContext.save()
        } catch {
            print("Failed to save model context: \(error)")
        }
        
    }
}

