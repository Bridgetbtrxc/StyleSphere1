import SwiftUI

struct Home: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                Text("Style that Matches You🔥")
                    .font(.system(size: 24, weight: .heavy))
                    .padding(.leading, 20)
                StyleInfoView()
                Banner()
                HStack {
                    Text("Your Wardrobe")
                        .font(.system(size: 24, weight: .heavy))
                    
                    Spacer()
                    NavigationLink(destination: WardrobeView()) {
                        Text("See All")
                            .font(.system(size: 16))
                    }
                }
                .padding(.horizontal, 20)
                YourWardrobe()
            }
        }
    }
    
   
    private func mainContentView() -> some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                Text("Style that Matches You🔥")
                    .font(.system(size: 24, weight: .heavy))
                    .padding(.leading, 20)
                StyleInfoView()
                Banner()
                HStack {
                    Text("Your Wardrobe")
                        .font(.system(size: 24, weight: .heavy))
                    
                    Spacer()
                    NavigationLink(destination: WardrobeView()) {
                        Text("See All")
                            .font(.system(size: 16))
                    }
                }
                .padding(.horizontal, 20)
                YourWardrobe()
            }
        }
    }
}

extension Color {
    init(hex: UInt32, alpha: CGFloat = 1.0) {
        let red = CGFloat((hex & 0xFF0000) >> 16) / 255.0
        let green = CGFloat((hex & 0x00FF00) >> 8) / 255.0
        let blue = CGFloat(hex & 0x0000FF) / 255.0
        self.init(red: red, green: green, blue: blue, opacity: alpha)
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
