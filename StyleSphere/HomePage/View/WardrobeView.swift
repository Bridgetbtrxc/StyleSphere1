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
    
    var columns: [GridItem] = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        NavigationView {
            VStack {
                Spacer().frame(height: 20)
                Text("Wardrobe")
                    .font(.headline)
                    .fontWeight(.bold)
                    .foregroundColor(Color.subColor)
                
                Spacer().frame(height: 30)
                Divider()
                
                ScrollView {
                    LazyVGrid(columns: columns) {
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
                            ForEach(wardrobeItems) { item in
                                NavigationLink(destination: CategoryDetail(selectedCategory: item.category, wardrobeitems: wardrobeItems)) {
                                    ClothingItemView(imageName: item.name, clothingType: item.category)
                                }
                            }
                        }
                    }
                    .padding()
                }
            }
            .navigationTitle("Your Wardrobe")
        }
        .onAppear {
            
        }
    }
}





struct ClothingItemView: View {
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

#Preview {
    let config = ModelConfiguration(isStoredInMemoryOnly: true)
    let container = try! ModelContainer(for: WardrobeItem.self, configurations: config)
    return WardrobeView().modelContainer(container)
    
}
