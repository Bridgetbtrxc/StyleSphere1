//  StyleInfoView.swift
//  StyleSphere
//
//  Created by MacBook Pro on 22/05/24.

import SwiftUI

struct StyleInfoView: View {
    @State private var data = Array(1...10)
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHGrid(rows: [GridItem(.fixed(150))], spacing: 20) {
                ForEach(data.indices, id: \.self) { index in
                    let imageIndex = index % 3
                    let imageName = "Style\(imageIndex + 1)"
                    
                    Button(action: {
                        // blabla
                    }) {
                        VStack(alignment: .leading, spacing: 10) {
                            Image(imageName)
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 180, height: 240)
                                .clipped()
                                .cornerRadius(20)
                        }
                        .frame(width: 180)
                        .background(Color(.systemBackground))
                        .cornerRadius(20)
                        .shadow(radius: 5)
                    }
                }
            }
            .padding(.horizontal)
        }
    }
}

struct StyleInfoView_Previews: PreviewProvider {
    static var previews: some View {
        StyleInfoView()
    }
}
