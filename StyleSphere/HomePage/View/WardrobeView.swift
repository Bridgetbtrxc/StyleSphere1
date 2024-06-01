//
//  WardrobeView.swift
//  StyleSphere
//
//  Created by MacBook Pro on 27/05/24.
//

import SwiftUI
import SwiftData


struct WardrobeView: View {
    @Environment(\.modelContext) var modelContext
    @Query var wardrobeItems: [WardrobeItem]
    
    var columns: [GridItem] = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        NavigationView {
            VStack {
                Spacer().frame(height: 20)
                Text("Wardrobe")
                    .font(.headline)
                    .fontWeight(.bold)
                    .foregroundColor(Color.subColor)
                
                Spacer().frame(height: 30)
                Divider()
                
                ScrollView {
                    LazyVGrid(columns: columns) {
                        ForEach(wardrobeItems) { wardrobeItem in
                            NavigationLink(destination: CategoryDetail(selectedCategory: wardrobeItem.category, wardrobeitems: wardrobeItems)) {
                                ClothingItemView(imageName: wardrobeItem.name, clothingType: wardrobeItem.category)
                            }
                        }
                    }
                    .padding()
                }
            }
            .onAppear {
                addSamples()  // Make sure this is called once or controlled to prevent duplicate entries
            }
        }
    }
    
    func addSamples(){
        
        
        // Create instances of WardrobeItem manually with updated categories
        let item1 = WardrobeItem(name: "Favorite Blue Shirt", category: "Kaos", color: "Blue")
        modelContext.insert(item1)
        
        let item2 = WardrobeItem(name: "Comfy Black Jeans", category: "Celana", color: "Black")
        modelContext.insert(item2)
        
        let item3 = WardrobeItem(name: "Red Summer Skirt", category: "Rok", color: "Red")
        modelContext.insert(item3)
        
        let item4 = WardrobeItem(name: "Elegant White Blouse", category: "Kemeja", color: "White")
        modelContext.insert(item4)
        
        let item5 = WardrobeItem(name: "Striped Office Shirt", category: "Kemeja", color: "Striped")
        modelContext.insert(item5)
        
        let item6 = WardrobeItem(name: "Gray Everyday T-shirt", category: "Kaos", color: "Gray")
        modelContext.insert(item6)
        
        let item7 = WardrobeItem(name: "Brown Leather Shoes", category: "Sepatu", color: "Brown")
        modelContext.insert(item7)
        
        let item8 = WardrobeItem(name: "Black Summer Sandals", category: "Sandal", color: "Black")
        modelContext.insert(item8)
        
        let item9 = WardrobeItem(name: "Green Outdoor Jacket", category: "Outerwear", color: "Green")
        modelContext.insert(item9)
        
        let item10 = WardrobeItem(name: "Pink Party Dress", category: "Dress", color: "Pink")
        modelContext.insert(item10)
        
        let item11 = WardrobeItem(name: "Gray Hoodie", category: "Outerwear", color: "Gray")
        modelContext.insert(item11)
        
        let item12 = WardrobeItem(name: "Purple Leggings", category: "Celana", color: "Purple")
        modelContext.insert(item12)
        
        let item13 = WardrobeItem(name: "Beige Summer Shorts", category: "Celana", color: "Beige")
        modelContext.insert(item13)
        
        let item14 = WardrobeItem(name: "Navy Winter Sweater", category: "Kaos", color: "Navy")
        modelContext.insert(item14)
        
        let item15 = WardrobeItem(name: "Yellow Graphic T-shirt", category: "Kaos", color: "Yellow")
        modelContext.insert(item15)
        
        let item16 = WardrobeItem(name: "Tan Leather Boots", category: "Sepatu", color: "Tan")
        modelContext.insert(item16)
        
        let item17 = WardrobeItem(name: "Silver High Heels", category: "Sandal", color: "Silver")
        modelContext.insert(item17)
        
        let item18 = WardrobeItem(name: "Black Formal Tie", category: "Accessory", color: "Black")
        modelContext.insert(item18)
        
        let item19 = WardrobeItem(name: "Brown Wool Scarf", category: "Accessory", color: "Brown")
        modelContext.insert(item19)
        
        let item20 = WardrobeItem(name: "White Winter Gloves", category: "Accessory", color: "White")
        modelContext.insert(item20)
        
    }
}




struct ClothingItemView: View {
    let imageName: String
    let clothingType: String
    
    var body: some View {
        VStack {
            Image(imageName)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 110, height: 110)
                .clipped()
            
            Spacer()
            Text(clothingType)
                .font(.body)
                .foregroundColor(.primary)
        }
        .frame(width: 145, height: 145)
        .padding()
        .background(Color.gray.opacity(0.1))
        .cornerRadius(8)
    }
}

#Preview {
    let config = ModelConfiguration(isStoredInMemoryOnly: true)
    let container = try! ModelContainer(for: WardrobeItem.self, configurations: config)
    //    for i in 1..<10{
    //        let wardrobe = WardrobeItem(name: "Data", category: "data", color: "data")
    //        container.mainContext.insert(wardrobe)
    //    }
    
    //    let item1 = WardrobeItem(name: "Favorite Blue Shirt", category: "Kaos", color: "Blue")
    //    container.mainContext.insert(item1)
    
    return WardrobeView().modelContainer(container)
    
}
