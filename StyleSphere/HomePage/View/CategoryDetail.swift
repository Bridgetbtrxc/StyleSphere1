import SwiftUI

struct CategoryDetail: View {
    var selectedCategory: String // Property to store the selected category
    @State private var selectedColor: Color? // State variable to track the selected color
    
    var body: some View {
        VStack {
            Spacer().frame(height: 20)
            Text(selectedCategory) // Display the selected category
                .font(.headline)
                .fontWeight(.bold)
                .foregroundColor(Color.subColor)
            
            Spacer().frame(height: 30)
            Divider()
            
            // Display image details or any other relevant information based on the selected category
            // You can use a switch statement or if-else conditions to customize the view based on the category
            switch selectedCategory {
            case "Shirts":
                Image("shirts_image") // Replace "shirts_image" with the actual image name for shirts
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 200, height: 200)
            case "Pants":
                Image("pants_image") // Replace "pants_image" with the actual image name for pants
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 200, height: 200)
            // Add more cases for other categories as needed
            default:
                Text("No details available for this category")
            }
            
            Spacer()
            
            // Stack of small buttons representing different colors
            HStack {
                ColorButton(color: .red, isSelected: selectedColor == .red) {
                    self.selectedColor = .red
                }
                ColorButton(color: .blue, isSelected: selectedColor == .blue) {
                    self.selectedColor = .blue
                }
                // Add more color buttons as needed
            }
            .padding(.vertical)
        }
    }
}

struct ColorButton: View {
    var color: Color
    var isSelected: Bool
    var action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Circle()
                .fill(color)
                .frame(width: 30, height: 30)
                .overlay(
                    Circle()
                        .stroke(Color.white, lineWidth: isSelected ? 3 : 0)
                )
        }
        .buttonStyle(PlainButtonStyle())
    }
}

struct CategoryDetail_Previews: PreviewProvider {
    static var previews: some View {
        CategoryDetail(selectedCategory: "Shirts") // Provide a selected category for preview
    }
}
