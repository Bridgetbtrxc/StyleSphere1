//
//  Wardrobe.swift
//  StyleSphere
//
//  Created by MacBook Pro on 23/05/24.
//

import SwiftUI

struct YourWardrobe: View {
    @State private var data = Array(1...10)
    
    var body: some View {
        VStack(alignment: .leading) {
            
            ScrollView(.horizontal, showsIndicators: false) {
                LazyHGrid(rows: [GridItem(.fixed(200))], spacing: 20) {
                    ForEach(data.indices, id: \.self) { index in
                        let imageIndex = index % 2
                        let imageName = "Wardrobe\(imageIndex + 1)"
                        let clothingType = imageIndex == 0 ? "Shirt" : "Pants"
                        
                        Button(action: {
                            // blabla
                        }) {
                            VStack(alignment: .center, spacing: 10) {
                                Image(imageName)
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 150, height: 150)
                                    .clipped()
                                    .cornerRadius(20)
                                
                                Text(clothingType)
                                    .font(Font.custom("Inter", size: 18))
                                    .foregroundColor(Color(red: 0.42, green: 0.31, blue: 0.22))
                                    .padding(.top, 10)
                                    .padding(.bottom, 15)
                                    .frame(width: 200, alignment: .center)
                                
                            }
                            .frame(width: 180, height: 200)
                            .background(Color(.systemBackground))
                            .cornerRadius(20)
                            .shadow(radius: 5)
                            .alignmentGuide(.leading) { _ in 150 }
                        }
                    }
                }
                .padding(.horizontal)
            }
        }
    }
}

struct YourWardrobe_Previews: PreviewProvider {
    static var previews: some View {
        YourWardrobe()
    }
}

