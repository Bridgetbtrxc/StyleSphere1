import SwiftUI

struct Home: View {
    var text: String
    
    var body: some View {
           VStack {
               Header()
               StyleInfoView()
               Banner()
               YourWardrobe()
           }
           .frame(maxWidth: .infinity, maxHeight: .infinity)
           .background(Color(NSColor.windowBackgroundColor))
       }
}

extension Color {
    init(hex: UInt32, alpha: CGFloat = 1.0) {
        let red = CGFloat((hex & 0xFF0000) >> 16) / 255.0
        let green = CGFloat((hex & 0x00FF00) >> 8) / 255.0
        let blue = CGFloat(hex & 0x0000FF) / 255.0
        
        self.init(
            red: red, green: green, blue: blue
        )
        
    }
}

#Preview {
    Home(text: "Hello")
}
