import SwiftUI



struct LookCardView: View {
    var look: LooksItem
    
    var itemsPrefix: ArraySlice<WardrobeItem> {
        look.items.prefix(4)
    }
    
    var cols: [GridItem] {
        Array(repeating: .init(.flexible()),
              count: 2)
    }
    
    var body: some View {
        VStack(spacing: 0) {
            ZStack {
                Rectangle()
                    .fill(Color.mainColor)
                
                LazyVGrid(columns: cols, alignment: .center) {
                    ForEach(itemsPrefix, id: \.self) { item in
                        
                        let loadedImage = item.image.flatMap(UIImage.init(data:)) ?? UIImage(named: "Wardrobe2")!
                        
                        Image(uiImage: loadedImage)
                            .resizable()
                            .scaledToFit()
                            .frame(minHeight: 100)
                            .cornerRadius(8)
                            .background(Color.white)
                            .cornerRadius(10)
                    }
                    if itemsPrefix.count < 4 {
                        ForEach(0..<(4 - itemsPrefix.count), id: \.self) { _ in
                            Rectangle()
                                .fill(Color.white)
                                .frame(minHeight: 100)
                                .cornerRadius(10)
                        }
                    }
                }.padding()
            }
            HStack {
                VStack(alignment: .leading) {
                    Text(look.name)
                        .font(.title.bold())
                        .multilineTextAlignment(.leading)
                    
                    Text("^[\(look.items.count) items](inflect: true)")
                        .font(.headline)
                        .padding(.bottom, 2)
                }
                .foregroundStyle(Color.subColor)
                .padding()
                
                Spacer()
            }
            .background(Color.mainColor)
        }
        .cornerRadius(12)
    }
    
}
#Preview {
    HStack {
        ModelPreview<LooksItem, LookCardView> { look in
            LookCardView(look: look)
        }
    }.frame(maxWidth: 300, maxHeight: 300)
}
