
import SwiftUI
import PhotosUI


struct LooksItemView: View {
    let imageName: String
    let clothingType: String
    
    var body: some View {
        VStack {
            Image(imageName)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 110, height: 110)
                .clipped()
            
            Spacer()
            Text(clothingType)
                .font(.body)
                .foregroundColor(.primary)
        }
        .frame(width: 145, height: 145)
        .padding()
        .background(Color.gray.opacity(0.1))
        .cornerRadius(8)
    }
}
