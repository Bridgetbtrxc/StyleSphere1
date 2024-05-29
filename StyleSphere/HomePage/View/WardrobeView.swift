//
//  WardrobeView.swift
//  StyleSphere
//
//  Created by MacBook Pro on 27/05/24.
//

import SwiftUI

struct WardrobeView: View {
    
    
    let wardrobeItems: [WardrobeItem] = [
        WardrobeItem(id: UUID(), category: "Baju", name: "T-Shirt", color: "Red"),
        WardrobeItem(id: UUID(), category: "Shirt", name: "Striped Shirt", color: "Blue"),
        WardrobeItem(id: UUID(), category: "Pants", name: "Pants", color: "Black"),
        WardrobeItem(id: UUID(), category: "Skirt", name: "Skirt", color: "Yellow"),
        WardrobeItem(id: UUID(), category: "Sepatu", name: "Sneakers", color: "White"),
        WardrobeItem(id: UUID(), category: "Sandal", name: "Flip Flops", color: "Green")
    ]
    
    var columns: [GridItem] = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        VStack {
            Spacer().frame(height: 20)
            Text("Wardrobe")
                .font(.headline)
                .fontWeight(.bold)
                .foregroundColor(Color.subColor)
            
            Spacer().frame(height: 30)
            Divider()
            
            Spacer()
            
            ScrollView {
                LazyVGrid(columns: self.columns) {
                    ForEach(wardrobeItems) { item in
                        ClothingItemView(imageName: item.category.lowercased(), clothingType: item.category)
                    }
                }
                .padding()
            }
        }
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
    WardrobeView()
}
