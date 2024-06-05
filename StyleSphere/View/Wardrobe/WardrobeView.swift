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
    
    
    var columns: [GridItem] {
        if UIDevice.isIPad {
            // 5 column
            return Array(repeating: .init(.flexible()), count: 5)
        }
        
        // 2 column
        return Array(repeating: .init(.flexible()), count: 2)
    }
    
    var body: some View {
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
        .navigationTitle("Your Wardrobe")
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
            } else if width > 400 {
                numberOfColumns = 2
            } else {
                numberOfColumns = 1
            }
            
            return Array(repeating: .init(.flexible()), count: numberOfColumns)
        }
}







#Preview {
    let config = ModelConfiguration(isStoredInMemoryOnly: true)
    let container = try! ModelContainer(for: WardrobeItem.self, configurations: config)
    return WardrobeView().modelContainer(container)
    
}
