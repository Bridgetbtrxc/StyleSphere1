//
//  YourWardrobe.swift
//  StyleSphereMac1
//
//  Created by MacBook Pro on 06/06/24.
//

import SwiftUI

struct YourWardrobe: View {
    @State private var data = Array(1...10)
    
    var body: some View {
        VStack(alignment: .leading) {
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(data.indices, id: \.self) { index in
                        let imageIndex = index % 2
                        let imageName = "Wardrobe\(imageIndex + 1)"
                        let clothingType = imageIndex == 0 ? "Shirt" : "Pants"
                        
                        Button(action: {
                            // Action when button is tapped
                            // blabla
                        }) {
                            VStack(alignment: .center, spacing: 10) {
                                Image(imageName)
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 90, height: 110)
                                    .cornerRadius(20) // Adjust corner radius to fit macOS design
                                
                                Text(clothingType)
                                    .font(Font.custom("Inter", size: 18))
                                    .foregroundColor(Color(NSColor.textColor)) // Use macOS equivalent
                                    .padding(.top, 10)
                                    .padding(.bottom, 15)
                                    .frame(width: 200, alignment: .center)
                            }
                            .background(Color(NSColor.windowBackgroundColor)) // Use macOS equivalent
                            .cornerRadius(20)
                            .shadow(radius: 5)
                        }.buttonStyle(PlainButtonStyle())
                    }
                }
            }
        }
    }
}

struct YourWardrobe_Previews: PreviewProvider {
    static var previews: some View {
        YourWardrobe()
    }
}

