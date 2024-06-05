import SwiftUI
import SwiftUIMasonry


struct LookCardView: View {
    var look: LooksItem
    
    
    var body: some View {
        ZStack {
            Rectangle()
                .fill(Color.mainColor)
            VMasonry(columns: 2) {
                ForEach(look.items.prefix(4), id: \.self) { look in
                    let loadedImage = look.image.flatMap(UIImage.init(data:)) ?? UIImage(named: "Wardrobe2")!
                    Image(uiImage: loadedImage)
                        .resizable()
                        .scaledToFit()
                        .cornerRadius(8)
                }
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
            
            VStack {
                Spacer()
                HStack {
                    VStack(alignment: .leading) {
                        Text(look.name)
                            .font(.headline)
                            .foregroundStyle(.white)
                            .padding(.bottom, 1)
                            .multilineTextAlignment(.leading)
                        
                        Text("^[\(look.items.count) item](inflect: true)")
                            .font(.subheadline)
                            .foregroundStyle(.white)
                            .padding(.bottom, 2)
                    }.padding()
                    Spacer()
                }
            }
            .frame(minHeight: 200, maxHeight: .infinity)
        }
        .cornerRadius(12)

    }
}
#Preview {
    ModelPreview<LooksItem, LookCardView> { look in
        LookCardView(look: look)
    }
}
