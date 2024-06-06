import SwiftUI

struct Wardrobe: View {
    let categories = ["Pants", "Skirt", "Clothing", "Shirt", "T-Shirt", "Sandal"]

    var body: some View {
        
            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
                    Text("Wardrobe")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .padding(.top, 20)

                    Text("Pick Your Category")
                        .font(.title2)
                        .fontWeight(.semibold)
                        .padding(.vertical, 10)

                    LazyVGrid(columns: Array(repeating: GridItem(.flexible(), spacing: 20), count: 2), spacing: 20) {
                        ForEach(categories, id: \.self) { category in
                            NavigationLink(destination: CategoryDetail(category: category)) {
                                CategoryCard(category: category)
                            }
                        }
                    }
                }
                .padding()
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            }.frame(minWidth: 700, maxWidth: .infinity, minHeight: 500, maxHeight: .infinity)
        }
        
    
}

struct CategoryCard: View {
    let category: String

    var body: some View {
        VStack {
            Image(categoryImageName(for: category))
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 150, height: 150)
                .cornerRadius(10)

            Text(category)
                .font(.caption)
                .foregroundColor(.white)
        }
        .padding(10)
        .background(Color.gray.opacity(0.5))
        .cornerRadius(10)
        .shadow(radius: 3)
    }

    func categoryImageName(for category: String) -> String {
        // Convert category name to a suitable format for image names in the asset catalog
        return category.lowercased().replacingOccurrences(of: " ", with: "_")
    }
}

struct CategoryDetail: View {
    let category: String

    var body: some View {
        VStack(spacing: 20) {
            Text(category)
                .font(.title)
                .bold()

            Text("Details about \(category)")
                .padding()

            Spacer()
        }
        .padding()
        .navigationTitle("\(category) Details")
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

struct Wardrobe_Previews: PreviewProvider {
    static var previews: some View {
        Wardrobe()
    }
}
