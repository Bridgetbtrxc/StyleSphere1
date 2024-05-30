//
//  WardrobeViewModel.swift
//  StyleSphere
//
//  Created by MacBook Pro on 29/05/24.
//

import Foundation

class WardrobeViewModel: ObservableObject {
    @Published var wardrobeItems: [WardrobeItem] = [
        WardrobeItem(id: UUID(), category: "Baju", name: "T-Shirt", color: "Red"),
        WardrobeItem(id: UUID(), category: "Shirt", name: "Striped Shirt", color: "Blue"),
        WardrobeItem(id: UUID(), category: "Pants", name: "Pants", color: "Black"),
        WardrobeItem(id: UUID(), category: "Skirt", name: "Skirt", color: "Yellow"),
        WardrobeItem(id: UUID(), category: "Sepatu", name: "Sneakers", color: "White"),
        WardrobeItem(id: UUID(), category: "Sandal", name: "Flip Flops", color: "Green")
    ]
    
    @Published var selectedCategory: String? 
 
}
