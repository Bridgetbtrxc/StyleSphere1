import SwiftUI
import SwiftData
import PhotosUI

struct CategoryDetail: View {
    
    var selectedCategory: String // Property to store the   selected
    @Binding var wardrobeitems: [WardrobeItem]
    @State private var showingAddNewItemModal = false
    @Environment(\.modelContext) var modelContext
    
    @State var selectedPhoto: PhotosPickerItem?
    
    
    var columns: [GridItem] = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    
    var body: some View {
        
        var filteredColors: [String] {
            let filteredItems = wardrobeitems.filter { $0.category == selectedCategory }
            let uniqueColors = Set(filteredItems.map { $0.color })
            return Array(uniqueColors).sorted()
        }
        
        var filteredCategoryItems: [WardrobeItem] {
            let items = wardrobeitems.filter { $0.category == selectedCategory }
            return Array(Set(items)) // Convert to Set and back to Array to remove duplicates
        }
        
        let uniqueItems = Array(Set(filteredCategoryItems)) // Remove duplicates

        VStack {
            
            Spacer().frame(height: 20)
            Text(selectedCategory) // Display the selected category
                .font(.headline)
                .fontWeight(.bold)
                .foregroundColor(Color.subColor)
            
            
            //color button
            
            
            ScrollView(.horizontal, showsIndicators: false) {
                LazyHStack {
                    ForEach(filteredColors, id: \.self) { color in
                        ColorButton(color: color)
                    }
                }
                .padding(.horizontal)
                
            }.frame(height:50)
            
            
            Divider()
            // Display image details or any other relevant information based on the selected category
            // You can use a switch statement or if-else conditions to customize the view based on the category
            
            
            Spacer()
            
            //            VStack() {
            //                Spacer()
            //                    .frame(height: 45)
            //                Image("Plus")
            //                    .resizable()
            //                    .frame(width: 40, height: 40)
            //                Text("Add New")
            //                    .foregroundColor(Color.gray)
            //
            //
            //            }
            
            ScrollView {
                LazyVGrid(columns: columns, spacing: 20) {
                    // First grid item for "Add New"
                    if(filteredCategoryItems.isEmpty){
                        VStack {
                            Image(systemName: "plus.circle.fill")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 40, height: 40)
                            Text("Theres No Clothing !")
                            Text("Add Now")
                                .foregroundColor(Color.gray)
                        }
                        .frame(width: 170, height: 186)
                        .background(Color.black.opacity(0.1))
                        .cornerRadius(14)
                        .sheet(isPresented: $showingAddNewItemModal) {
                            AddNewItemView()
                        }
                    }else{
                        Button(action: {
                            showingAddNewItemModal = true
                        }) {
                            Label("Add New", systemImage: "plus.circle.fill")
                                .foregroundColor(.gray)
                                .padding()
                                .background(Color.black.opacity(0.1))
                                .cornerRadius(14)
                        }
                        .sheet(isPresented: $showingAddNewItemModal) {
                            AddNewItemView()
                        }
                        // Other items in the grid
                        ForEach(filteredCategoryItems) { item in
                            ClothingDetails(item: item)
                                .frame(width: 170, height: 186) // Ensure consistent sizing for each grid item
                                .background(Color.black.opacity(0.2)) // Apply background to each item individually
                                .cornerRadius(14)
                                .swipeActions {
                                    
                                    Button(role: .destructive) {
                                        
                                        withAnimation {
                                            modelContext.delete(item)
                                        }
                                        
                                    } label: {
                                        Label("Delete", systemImage: "trash.fill")
                                    }
                                    
                                    
                                }
                        }
                    }
                    
                    
                }
                .padding()
            }
            
            
            
            
            
            
            Spacer()
            Spacer()
            Spacer()
            //            func colorsForCategory() -> [String] {
            //                  let filteredItems = wardrobeitems.filter { $0.category == selectedCategory }
            //                  let uniqueColors = Set(filteredItems.map { $0.color })
            //                  return Array(uniqueColors).sorted()
            //              }
            
        }
    }
}

struct AddNewItemView: View {
    @Environment(\.modelContext) var modelContext
    @Environment(\.dismiss) var dismiss
    
    @State private var item = WardrobeItem()
  
    @State private var name: String = ""
    @State private var category: String = ""
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
                        Label("Add Image",systemImage: "photo ")
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
           try? modelContext.save()
       }
}

struct ClothingDetails: View{
    
    
    
    let item: WardrobeItem
    
    var body: some View {
   
        VStack(alignment: .leading){
           

            
            Spacer()
                .frame(height: 100)
            Text(item.name)
                .foregroundColor(Color.black)
                .zIndex(1)
            
            if let imageData = item.image, let uiImage = UIImage(data: imageData) {
                Image(uiImage: uiImage)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 170, height: 300)
                    .clipped()
            }
            
        }
        .foregroundColor(.clear)
        .frame(width: 215, height: 186)
        .background(
            LinearGradient(
                stops: [
                    Gradient.Stop(color: .black.opacity(0), location: 0.41),
                    Gradient.Stop(color: .black.opacity(0.32), location: 0.85),
                ],
                startPoint: UnitPoint(x: 0.5, y: 0),
                endPoint: UnitPoint(x: 0.5, y: 1)
            )
            
        )
//        .background(
//            Image(item.image)
//                .resizable()
//                .aspectRatio(contentMode: .fill)
//                .frame(width: 186, height: 186)
//                .clipped()
       
    }
    
    
}

struct ColorButton: View {
    let color: String
    
    var body: some View {
        
        
        Text(color)
            .padding(.horizontal, 20)
            .padding(.vertical, 5)
            .background(Color.mainColor) // Ensure mainColor is defined
            .cornerRadius(16)
            .overlay(
                RoundedRectangle(cornerRadius: 16)
                    .inset(by: 0.5)
                    .stroke(Color.subColor, lineWidth: 1) )
        
        
        
    }
}


#Preview {
    let config = ModelConfiguration(isStoredInMemoryOnly: true)
    let container = try! ModelContainer(for: WardrobeItem.self, configurations: config)
    let wardrobeItems = [
        WardrobeItem(name: "Favorite Blue Shirt", category: "Shirts", color: "Blue"),
        WardrobeItem(name: "Comfy Black Jeans", category: "Pants", color: "Black"),
        WardrobeItem(name: "Comfy Black Jeans", category: "Pants", color: "Black")
        ,
        WardrobeItem(name: "Comfy Black Jeans", category: "Pants", color: "Black")
        ,
        WardrobeItem(name: "Comfy Black Jeans", category: "Pants", color: "Black")
        // Add more wardrobe items as needed
    ]    //    for i in 1..<10{
    //        let wardrobe = WardrobeItem(name: "Data", category: "data", color: "data")
    //        container.mainContext.insert(wardrobe)
    //    }
    
    //    let item1 = WardrobeItem(name: "Favorite Blue Shirt", category: "Kaos", color: "Blue")
    //    container.mainContext.insert(item1)
    
//    return CategoryDetail(selectedCategory: "Pants", wardrobeitems: $wardrobeItems).modelContainer(container)
    
}

