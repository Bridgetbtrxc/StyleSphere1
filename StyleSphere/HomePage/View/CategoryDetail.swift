import SwiftUI
import SwiftData

struct CategoryDetail: View {
    
    var selectedCategory: String // Property to store the selected
    var wardrobeitems: [WardrobeItem]
    
    
    
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
            switch selectedCategory {
            case "Shirts":
                Image("shirts_image") // Replace "shirts_image" with the actual image name for shirts
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 200, height: 200)
            case "Pants":
                Image("pants_image") // Replace "pants_image" with the actual image name for pants
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 200, height: 200)
                // Add more cases for other categories as needed
            default:
                Text("No details available for this category")
            }
            
            
            
            Spacer()
            
            //            func colorsForCategory() -> [String] {
            //                  let filteredItems = wardrobeitems.filter { $0.category == selectedCategory }
            //                  let uniqueColors = Set(filteredItems.map { $0.color })
            //                  return Array(uniqueColors).sorted()
            //              }
            
        }
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

