//
//  ClothingDetails.swift
//  StyleSphere
//
//  Created by MacBook Pro on 03/06/24.
//

import SwiftUI
import PhotosUI
import SwiftData

struct ClothingDetails: View{
    let item: WardrobeItem
    let decodedImage: UIImage
    
    init(item: WardrobeItem) {
        self.item = item
        
        if let data = item.image {
            decodedImage = UIImage(data: data) ?? UIImage(named: "Wardrobe2")!
        } else {
            decodedImage = UIImage(named: "Wardrobe2")!
        }
    }
    
    var body: some View {
        GeometryReader { geometry in  // Use GeometryReader to adapt to the container size
            ZStack {
                Image(uiImage: decodedImage)
                    .resizable()
                    .scaledToFill()
                    .frame(width: geometry.size.width, height: geometry.size.height) // Use the geometry's size
                    .clipped()

                Rectangle()
                    .fill(LinearGradient(
                        stops: [
                            Gradient.Stop(color: .black.opacity(0), location: 0.41),
                            Gradient.Stop(color: .black.opacity(0.7), location: 0.85),
                        ],
                        startPoint: .top,
                        endPoint: .bottom
                    ))

                VStack(alignment: .leading) {
                    Spacer()
                    Text(item.name)
                        .foregroundColor(.white)
                        .font(.headline.bold())
                    Text(item.color)
                        .foregroundColor(.white)
                        .font(.subheadline)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding([.bottom, .leading], 15)
            }
            .cornerRadius(10)
            .frame(width: geometry.size.width, height: geometry.size.height) // Match ZStack size to GeometryReader
        }
    }

}

#Preview {
    ModelPreview<WardrobeItem, VStack> { item in
        VStack {
            ClothingDetails(item: item).frame(width: 215, height: 186)
        }
    }
}
