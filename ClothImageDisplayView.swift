//
//  ClothingDetails.swift
//  StyleSphere
//
//  Created by MacBook Pro on 03/06/24.
//

import SwiftUI
import PhotosUI
import SwiftData

struct ClothImageDisplayView: View {
    let item: WardrobeItem
    @State private var decodedImage: UIImage?

    var body: some View {
        GeometryReader { geometry in
            ZStack {
                if let uiImage = decodedImage {
                    Image(uiImage: uiImage)
                        .resizable()
                        .scaledToFill()
                        .frame(width: geometry.size.width, height: geometry.size.height)
                        .clipped()
                } else {
                    ProgressView() // Show a loading indicator while the image is loading
                        .frame(width: geometry.size.width, height: geometry.size.height)
                        .background(Color.gray.opacity(0.1)) // Optional: a placeholder color
                }

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
            .frame(width: geometry.size.width, height: geometry.size.height)
            .onAppear {
                loadDecodedImage()
            }
        }
    }
    
    private func loadDecodedImage() {
        DispatchQueue.global(qos: .userInteractive).async {
            let loadedImage = item.image.flatMap(UIImage.init(data:)) ?? UIImage(named: "Wardrobe2")!
            DispatchQueue.main.async {
                self.decodedImage = loadedImage
            }
        }
    }
}

#Preview {
    ModelPreview<WardrobeItem, VStack> { item in
        VStack {
            ClothImageDisplayView(item: item).frame(width: 215, height: 186)
        }
    }
}
