//
//  WardrobeView.swift
//  StyleSphere
//
//  Created by MacBook Pro on 27/05/24.
//

import SwiftUI
import SwiftData


struct WardrobeView: View {
    @State private var showingAddNewItemModal = false
    @Environment(\.modelContext) var modelContext
    @Query var wardrobeItems: [WardrobeItem]
    
    let categories = ["Celana", "Rok", "Kemeja", "Kaos", "Sandal", "Sepatu"]
    
    var body: some View {
        NavigationStack {
            VStack {
                Spacer().frame(height: 20)
                Text("Wardrobe")
                    .font(.headline)
                    .fontWeight(.bold)
                    .foregroundColor(Color.subColor)
                
                Spacer().frame(height: 30)
                Divider()
                
                GeometryReader { geometry in
                    ScrollView {
                        LazyVGrid(columns: columns(for: geometry.size.width), spacing: 5) {
                            if wardrobeItems.isEmpty {
                                Button(action: {
                                    showingAddNewItemModal = true
                                }) {
                                    Label("Add New", systemImage: "plus.circle.fill")
                                        .foregroundColor(.gray)
                                        .padding()
                                        .background(Color.black.opacity(0.1))
                                        .cornerRadius(14)
                                }
                                .sheet(isPresented: $showingAddNewItemModal) {
                                    AddNewItemView()
                                }
                            } else {
                                ForEach(categories, id: \.self) { category in
                                    NavigationLink(destination: CategoryDetail(selectedCategory: category)) {
                                        ClothingItemView(
                                            imageName: category,
                                            clothingType: category
                                        )
                                    }
                                }
                            }
                        }
                    }
                }
                .padding()
            }
        }
}
    private func columns(for width: CGFloat) -> [GridItem] {
            // Adjust these thresholds based on your design needs
            let numberOfColumns: Int
            if width > 1000 {
                numberOfColumns = 5
            } else if width > 800 {
                numberOfColumns = 4
            } else if width > 600 {
                numberOfColumns = 3
            } else {
                numberOfColumns = 2
            }
            return Array(repeating: .init(.flexible()), count: numberOfColumns)
        }
}


#Preview {
    struct PreviewContent: View {
        var body: some View {
            WardrobeView()
                .modelContainer(SwiftDataModel.container)
        }
    }
    
    return PreviewContent()
}
