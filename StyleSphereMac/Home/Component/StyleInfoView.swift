import SwiftUI

struct StyleInfoView: View {
    @State private var data = Array(1...10)
    
    var body: some View {
     
            ScrollView(.horizontal, showsIndicators: false) {
                Text("Style That Matches You🔥")
                    .font(Font.custom("Inter", size: 16).weight(.bold))
                    .foregroundColor(Color(NSColor.textColor)) // macOS specific color
                
                LazyHGrid(rows: [GridItem(.fixed(150))], spacing: 20) {
                    ForEach(data.indices, id: \.self) { index in
                        let imageIndex = index % 3
                        let imageName = "Style\(imageIndex + 1)"
                        
                        Button(action: {
                            // Button action
                        }) {
                            VStack(alignment: .leading, spacing: 10) {
                                Image(imageName)
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 150, height: 200)
                                    .cornerRadius(20)
                            }
                            .frame(width: 120)
                            .cornerRadius(20)
                            .shadow(radius: 5)
                        }
                    }
                }
            }
        }
    }


