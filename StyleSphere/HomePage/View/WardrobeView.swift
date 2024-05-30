//
//  WardrobeView.swift
//  StyleSphere
//
//  Created by MacBook Pro on 27/05/24.
//

import SwiftUI



struct WardrobeView: View {
    @EnvironmentObject var wardrobeViewModel: WardrobeViewModel
    
    @State private var selectedCategory: String? // State variable to track selected category
    
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
                
                Spacer()
                
                ScrollView {
                    LazyVGrid(columns: self.columns) {
                        ForEach(wardrobeViewModel.wardrobeItems, id: \.category) { item in
                            NavigationLink(destination: CategoryDetail(selectedCategory: item.category)) {
                                ClothingItemView(imageName: item.category.lowercased(), clothingType: item.category)
                            }
                        }
                    }
                    .padding()
                }
            }
            .navigationTitle("Wardrobe")
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
        .environmentObject(WardrobeViewModel()) 
}
