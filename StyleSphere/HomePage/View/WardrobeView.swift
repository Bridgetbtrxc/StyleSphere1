//
//  WardrobeView.swift
//  StyleSphere
//
//  Created by MacBook Pro on 27/05/24.
//

import SwiftUI

struct WardrobeView: View {
    let data: [String] = ["Shirt", "Pants", "Dress", "Jacket"]
    
    var body: some View {
        VStack{
            Spacer().frame(height:20)
            Text("Wardrobe")
                .font(.headline)
                .fontWeight(.bold)
                .foregroundColor(Color.subColor)
            Spacer().frame(height: 40)
            Divider()
            
            Spacer()
            
            ScrollView {
                        LazyVStack(spacing: 20) {
                            ForEach(data.indices, id: \.self) { index in
                                let imageIndex = index % 2
                                let imageName = "Wardrobe\(imageIndex + 1)"
                                let clothingType = data[index]
                                
                                ClothingItemView(imageName: imageName, clothingType: clothingType)
                            }
                        }
                        .padding(.horizontal)
                    }
            
            
            
        }
    }
}

#Preview {
    WardrobeView()
}
