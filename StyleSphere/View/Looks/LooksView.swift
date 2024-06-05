//
//  WardrobeView.swift
//  StyleSphere
//
//  Created by MacBook Pro on 27/05/24.
//

import SwiftUI
import SwiftData


struct LooksView: View {
    @State private var showingAddNewItemModal = false
    @Environment(\.modelContext) var modelContext
    @Query var LooksItems: [LooksItem]
    
    let categories = ["Celana", "Rok", "Kemeja", "Kaos", "Sandal", "Sepatu"]
    
    var columns: [GridItem] = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        NavigationView {
            Text("Create a look from your wardrobe here !")
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
                        if LooksItems.isEmpty {
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
                                CreateLookView()
                            }
                        } else {
                            ForEach(categories, id: \.self) { category in
                                NavigationLink(destination: CategoryDetail(selectedCategory: category)) {
                                    LooksItemView(
                                        name: name
                                        imageName: category,
                                        clothingType: category
                                    )
                                }
                            }
                        }
                        
                        
                    }
                    .padding()
                }
            }
            .navigationTitle("Looks")
            
            
        }
        .onAppear {
            
        }
    }
}







#Preview {
    let config = ModelConfiguration(isStoredInMemoryOnly: true)
    let container = try! ModelContainer(for: LooksItem.self, configurations: config)
    return LooksView().modelContainer(container)
    
}
