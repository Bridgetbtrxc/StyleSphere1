import SwiftUI
import SwiftData
import PhotosUI

struct CategoryDetail: View {
    
    let selectedCategory: String
    @State private var showingAddNewItemModal = false
    @Environment(\.modelContext) var modelContext
    
    @State var selectedPhoto: PhotosPickerItem?
    @State var selectedColor: String = ""
    
    @Query var allWardrobeItems: [WardrobeItem]
    @State var wardrobeItems: [WardrobeItem] = []
    
    
    
    init(selectedCategory: String) {
        self.selectedCategory = selectedCategory
        _allWardrobeItems = Query(filter: #Predicate<WardrobeItem> {
            $0.category == selectedCategory
        })
    }
    
    var columns: [GridItem] = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var filteredColors: [String] {
        let uniqueColors = Set(allWardrobeItems.map { $0.color })
        return Array(uniqueColors).sorted()
    }
    
    func syncSearchedColor() {
        withAnimation {
            if selectedColor.isEmpty {
                wardrobeItems = allWardrobeItems
            } else {
                wardrobeItems = allWardrobeItems.filter {
                    $0.color == selectedColor
                }
            }
        }
    }
    
    var body: some View {
        
        VStack {
            
            Spacer().frame(height: 20)
            Text(selectedCategory)
                .font(.headline)
                .fontWeight(.bold)
                .foregroundColor(Color.subColor)
                .onAppear {
                   syncSearchedColor()
                }
            
            ScrollView(.horizontal, showsIndicators: false) {
                LazyHStack {
                    ForEach(filteredColors, id: \.self) { color in
                        ColorButton(selection: $selectedColor, color: color)
                    }
                }
                .padding(.horizontal)
                .onChange(of: selectedColor) {
                   syncSearchedColor()
                }
                
            }.frame(height:50)
            
            
            Divider()
            
            
            
            Spacer()
            
            
            ScrollView {
                LazyVGrid(columns: columns, spacing: 20) {
                    if(wardrobeItems.isEmpty){
                        Button(action: {
                            showingAddNewItemModal = true
                        }) {
                            VStack {
                                Image(systemName: "plus.circle.fill")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 40, height: 40)
                                Text("There's No Clothing !")
                                Text("Add Now")
                                    .foregroundColor(Color.gray)
                            }
                            .frame(width: 170, height: 186)
                            .background(Color.black.opacity(0.1))
                            .cornerRadius(14)
                        }
                        .contentShape(Rectangle())
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
                        
                        ForEach(wardrobeItems) { item in
                            ClothingDetails(item: item)
                                .frame(width: 170, height: 186)
                                .background(Color.black.opacity(0.2))
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
            
        }
    }
}








//#Preview {
//    let config = ModelConfiguration(isStoredInMemoryOnly: true)
//    let container = try! ModelContainer(for: WardrobeItem.self, configurations: config)
//    let wardrobeItems = [
//        WardrobeItem(name: "Favorite Blue Shirt", category: "Shirts", color: "Blue"),
//        WardrobeItem(name: "Comfy Black Jeans", category: "Pants", color: "Black"),
//        WardrobeItem(name: "Comfy Black Jeans", category: "Pants", color: "Black")
//        ,
//        WardrobeItem(name: "Comfy Black Jeans", category: "Pants", color: "Black")
//        ,
//        WardrobeItem(name: "Comfy Black Jeans", category: "Pants", color: "Black")
//        // Add more wardrobe items as needed
//    ]    //    for i in 1..<10{
//    //        let wardrobe = WardrobeItem(name: "Data", category: "data", color: "data")
//    //        container.mainContext.insert(wardrobe)
//    //    }
//
//    //    let item1 = WardrobeItem(name: "Favorite Blue Shirt", category: "Kaos", color: "Blue")
//    //    container.mainContext.insert(item1)
//
////    return CategoryDetail(selectedCategory: "Pants", wardrobeitems: $wardrobeItems).modelContainer(container)
//
//}

