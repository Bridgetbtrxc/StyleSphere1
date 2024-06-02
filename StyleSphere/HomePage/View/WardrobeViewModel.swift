//
//  WardrobeViewModel.swift
//  StyleSphere
//
//  Created by MacBook Pro on 01/06/24.
//

import Foundation

class WardrobeViewModel: ObservableObject {
    @Published var wardrobeItems: [WardrobeItem] = [
//        WardrobeItem(name: "T-Shirt", category: "Baju", color: "Red"),
//        WardrobeItem(name: "Striped Shirt", category: "Shirt", color: "Blue"),
//        WardrobeItem(name: "Pants", category: "Pants", color: "Black"),
//        WardrobeItem(name: "Skirt", category: "Skirt", color: "Yellow"),
//        WardrobeItem(name: "Sneakers", category: "Sepatu", color: "White"),
//        WardrobeItem(name: "Flip Flops", category: "Sandal", color: "Green")
    ]
    
    @Published var selectedCategory: String?
}
