import SwiftUI

struct StyleInfoView: View {
    @State private var data = Array(1...10)
    
    var body: some View {
        ScrollViewReader { proxy in
            ScrollView(.horizontal, showsIndicators: false) {
                LazyHGrid(rows: [GridItem(.fixed(150))], spacing: 20) {
                    ForEach(data.indices, id: \.self) { index in
                        let imageIndex = index % 3
                        let imageName = "Style\(imageIndex + 1)"
                        
                        Button(action: {
                            // Action when button is tapped
                            // blabla
                        }) {
                            VStack(alignment: .leading, spacing: 10) {
                                Image(imageName)
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 150, height: 200)
                                    .clipped()
                                    .cornerRadius(20)
                            }
                            .frame(width:120)
                            // Use macOS equivalent
                            .cornerRadius(20)
                            .shadow(radius: 5)
                        }
                    }.buttonStyle(PlainButtonStyle())
                }
                
                .onAppear {
                    // Do something when the view appears
                }
            }
        }
    }
}

struct StyleInfoView_Previews: PreviewProvider {
    static var previews: some View {
        StyleInfoView()
    }
}
