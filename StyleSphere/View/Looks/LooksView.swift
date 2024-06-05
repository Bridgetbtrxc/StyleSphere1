//
//  WardrobeView.swift
//  StyleSphere
//
//  Created by MacBook Pro on 27/05/24.
//

import SwiftUI
import SwiftData


struct LooksView: View {
    @Environment(\.modelContext) var modelContext
    @Query var looksItem: [LooksItem]
    
    let categories = ["Celana", "Rok", "Kemeja", "Kaos", "Sandal", "Sepatu"]
    
    var columns: [GridItem] = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        NavigationStack {
            Group {
                if looksItem.isEmpty {
                    ContentUnavailableView("No looks yet", systemImage: "questionmark")
                } else {
                    ScrollView {
                        LazyVGrid(columns: columns, spacing: 16) {
                            ForEach(looksItem, id: \.self) { look in
                                NavigationLink(destination: EmptyView()) {
                                    LookCardView(look: look)
                                }
                            }
                        }
                        .padding()
                    }
                }
            }
            .navigationTitle("Looks")
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarTitleTextColor(Color.subColor)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    NavigationLink(destination: CreateLookView()) {
                        Image(systemName: "plus")
                    }
                }
            }
        }
    }
}


#Preview {
    return LooksView().modelContainer(SwiftDataModel.container)
    
}
