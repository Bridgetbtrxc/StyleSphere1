import SwiftUI
import SwiftData

struct CategoryDetail: View {
    
    var selectedCategory: String // Property to store the selected
    var wardrobeitems: [WardrobeItem]
    
    
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
                    VStack {
                        Image(systemName: "plus.circle.fill")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 40, height: 40)
                        Text("Add New")
                            .foregroundColor(Color.gray)
                    }
                    .frame(width: 170, height: 186)
                    .background(Color.black.opacity(0.1))
                    .cornerRadius(14)
                    
                    // Other items in the grid
                    ForEach(wardrobeitems) { item in
                        ClothingDetails(name: item.name)
                            .frame(width: 170, height: 186) // Ensure consistent sizing for each grid item
                            .background(Color.black.opacity(0.2)) // Apply background to each item individually
                            .cornerRadius(14)
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

struct ClothingDetails: View{
    
    let name: String
    
    var body: some View {
        
        VStack(alignment: .leading){
            Spacer()
                .frame(height: 100)
            Text(name)
                .foregroundColor(Color.black)
            
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
        .background(
            Image(name)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 186, height: 186)
                .clipped()
        )
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
    
    return CategoryDetail(selectedCategory: "Pants", wardrobeitems: wardrobeItems).modelContainer(container)
    
}

