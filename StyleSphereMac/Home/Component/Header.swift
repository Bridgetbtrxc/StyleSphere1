import SwiftUI

//struct Header: View {
//    var body: some View {
//        ScrollView {
//            VStack(alignment: .leading, spacing: 10) {
//                HStack {
//                    VStack(alignment: .leading, spacing: 4) {
//                        Text("Bridget Beatrix Claire")
//                            .font(.title3)
//                            .fontWeight(.bold)
//                        Text("Choose Your Style")
//                            .font(.body)
//                    }
//                    Spacer()
//                    Image("dots")
//                        .padding(12)
//                        .background(Color(NSColor.windowBackgroundColor)) // macOS specific color
//                        .cornerRadius(32)
//                }
//                .padding(.horizontal, 20)
//                .padding(.top, 20)
//
//                
//                StyleInfoView().frame(height: 200)
//                
//                Banner() // Assuming you have this view implemented
//                YourWardrobe()
//            }
//            .frame(maxWidth: 500)
//            .padding()
//        }
//    }
//}

struct Header: View {
    var body: some View {
        VStack(alignment: .leading) {
            Text("Bridget Beatrix Claire")
                .font(.title3)
                .fontWeight(.bold)
            Text("Choose Your Style")
                .font(.body)
            Text("Style That Matches You 🔥")
                .font(.headline)
            Spacer()
            Image("dots")
                .padding(12)
                .background(Color(NSColor.windowBackgroundColor)) // macOS specific color
                .cornerRadius(32)
        }
        .padding(.horizontal)
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}