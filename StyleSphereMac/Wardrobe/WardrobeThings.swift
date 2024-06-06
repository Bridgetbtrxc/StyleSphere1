import SwiftUI

struct WardrobeThings: View {
    var body: some View {
        VStack {
            Text("Shirts")
                .font(.custom("Inter", size: 18).weight(.bold))
                .foregroundColor(Color(red: 0.42, green: 0.31, blue: 0.22))
                .padding(.bottom, 20)

            ScrollView(.horizontal, showsIndicators: false) {
                HStack(alignment: .top, spacing: 15) {
                    ColorButton(label: "Black", textColor: Color(red: 0.87, green: 0.81, blue: 0.75), backgroundColor: Color(red: 0.42, green: 0.31, blue: 0.22))
                    ColorButton(label: "Grey", textColor: Color(red: 0.42, green: 0.31, blue: 0.22), backgroundColor: Color(red: 0.93, green: 0.90, blue: 0.85))
                    ColorButton(label: "White", textColor: Color(red: 0.42, green: 0.31, blue: 0.22), backgroundColor: Color(red: 0.93, green: 0.90, blue: 0.85))
                    ColorButton(label: "Invisible", textColor: Color(red: 0.42, green: 0.31, blue: 0.22), backgroundColor: Color(red: 0.93, green: 0.90, blue: 0.85))
                }
                .frame(height: 50)
            }
            Divider()
            
            
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.white)
        
        
    }
    
}

struct ColorButton: View {
    let label: String
    let textColor: Color
    let backgroundColor: Color

    var body: some View {
        Text(label)
            .font(.custom("Inter", size: 22.5).weight(.medium))
            .foregroundColor(textColor)
            .padding(EdgeInsets(top: 6.43, leading: 19.29, bottom: 6.43, trailing: 19.29))
            .background(backgroundColor)
            .cornerRadius(25.71)
            .overlay(
                RoundedRectangle(cornerRadius: 25.71)
                    .inset(by: 0.8)
                    .stroke(backgroundColor, lineWidth: 0.8)
            )
    }
}

struct WardrobeThings_Previews: PreviewProvider {
    static var previews: some View {
        WardrobeThings()
    }
}
