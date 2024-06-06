import SwiftUI

struct StyleInfoView: View {
    @State private var data = Array(1...10)
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHGrid(rows: [GridItem(.fixed(200))], spacing: 30) {
                ForEach(data.indices, id: \.self) { index in
                    let imageIndex = index % 3
                    let imageName = "Style\(imageIndex + 1)"
                    
                    Button(action: {
                        // Add action
                    }) {
                        VStack(alignment: .leading, spacing: 10) {
                            Image(imageName)
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 200, height: 250)
                                .clipped()
                                .cornerRadius(20)
                        }
                        .frame(width: 200)
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
