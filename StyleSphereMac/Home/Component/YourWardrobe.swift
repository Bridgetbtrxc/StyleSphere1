import SwiftUI

struct YourWardrobe: View {
    @State private var data = Array(1...10)

    var body: some View {
        VStack(alignment: .leading) {
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 20) { // Increased spacing for a more spacious layout
                    ForEach(data.indices, id: \.self) { index in
                        let imageIndex = index % 2
                        let imageName = "Wardrobe\(imageIndex + 1)"
                        let clothingType = imageIndex == 0 ? "Shirt" : "Pants"
                        
                        Button(action: {
                            // Button action
                        }) {
                            VStack(alignment: .center, spacing: 10) {
                                Image(imageName)
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 90, height: 110)
                                    .cornerRadius(20)
                                
                                Text(clothingType)
                                    .font(Font.custom("Inter", size: 18))
                                    .foregroundColor(Color(NSColor.textColor))
                                    .padding(.top, 10)
                                    .frame(width: 200, alignment: .center)
                            }
                            .background(Color(NSColor.windowBackgroundColor))
                            .cornerRadius(20)
                            .shadow(radius: 5)
                        }
                        .buttonStyle(PlainButtonStyle())
                    }
                }
            }
        }
    }
}
