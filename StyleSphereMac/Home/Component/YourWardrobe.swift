//
//  YourWardrobe.swift
//  StyleSphereMac
//
//  Created by MacBook Pro on 07/06/24.
//

import SwiftUI

struct YourWardrobe: View {
    @State private var data = Array(1...10)
    
    var body: some View {
        VStack(alignment: .leading) {
            ScrollView(.horizontal, showsIndicators: false) {
                LazyHGrid(rows: [GridItem(.fixed(200))], spacing: 30) {
                    ForEach(data.indices, id: \.self) { index in
                        let imageIndex = index % 2
                        let imageName = "Wardrobe\(imageIndex + 1)"
                        let clothingType = imageIndex == 0 ? "Shirt" : "Pants"
                        
                        Button(action: {
                            // Add action
                        }) {
                            VStack(alignment: .center, spacing: 10) {
                                Image(imageName)
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 130, height: 130)
                                    .clipped()
                                
                                Text(clothingType)
                                    .font(.system(size: 18))
                                    .frame(width: 200, alignment: .center)
                            }
                            .frame(width: 180, height: 200)
                            .background(Color(nsColor: .windowBackgroundColor))
                            .cornerRadius(20)
                            .shadow(radius: 5)
                        }
                    }
                }
                .padding(.horizontal)
            }
        }
    }
}
