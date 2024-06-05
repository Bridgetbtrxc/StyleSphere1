import SwiftUI
import SwiftData
import PhotosUI

struct CategoryContentView: View {
    
    let selectedCategory: String
    @State private var showingAddNewItemModal = false
    @Environment(\.modelContext) var modelContext
    
    @State var selectedPhoto: PhotosPickerItem?
    @State var selectedColor: String = ""
    @State var searchClothing: String = ""
    
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
            if selectedColor == "" {
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
            VStack {
                SearchbarView(text: $searchClothing)
                    .padding()
                    .navigationTitle(selectedCategory)
                    .navigationBarTitleTextColor(Color.subColor)
                    .onChange(of: searchClothing) {
                        if searchClothing == "" {
                            wardrobeItems = allWardrobeItems
                        } else {
                            wardrobeItems = allWardrobeItems.filter {
                                $0.name.lowercased().contains(searchClothing.lowercased())
                            }
                        }
                    }
                    .onAppear {
                        selectedColor = ""
                        wardrobeItems = allWardrobeItems
                    }
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        ForEach(filteredColors, id: \.self) { color in
                            ColorButton(selection: $selectedColor, color: color)
                        }
                    }
                    .padding(.horizontal)
                    .onChange(of: selectedColor) {
                        syncSearchedColor()
                    }
                    
                }
                
                Divider().padding(.top)
            }
           
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
                        
                    }else{
                        Button(action: {
                            showingAddNewItemModal = true
                        }) {
                            Label("Add New", systemImage: "plus.circle.fill")
                                .foregroundColor(.gray)
                                .padding()
                                .frame(maxWidth: .infinity, maxHeight: .infinity)
                                .background(Color.black.opacity(0.1))
                                .cornerRadius(14)
                        }
                        ForEach(wardrobeItems) { item in
                            ClothImageDisplayView(item: item)
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
                .onChange(of: showingAddNewItemModal) {
                    // if the sheet is closed, resync the searched color
                    if !showingAddNewItemModal {
                        syncSearchedColor()
                    }
                }
                .sheet(isPresented: $showingAddNewItemModal) {
                    AddNewItemView()
                }
            
        }
    }
}

#Preview {
    struct PreviewContent: View {
        var body: some View {
            CategoryContentView(selectedCategory: "Celana")
                .modelContainer(SwiftDataModel.container)
        }
    }
    
    return PreviewContent()
}
