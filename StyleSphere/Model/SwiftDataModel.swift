//
//  SwiftDataModel.swift
//  StyleSphere
//
//  Created by Macbook on 02/06/24.
//

import Foundation
import SwiftData

@MainActor
final class SwiftDataModel {
    static let container: ModelContainer = {
        do {
            let config = ModelConfiguration(isStoredInMemoryOnly: true)
            let container = try ModelContainer(for: WardrobeItem.self, configurations: config)
            [
                WardrobeItem(name: "T-Shirt", category: "Baju", color: "Red"),
                WardrobeItem(name: "Striped Shirt", category: "Shirt", color: "Blue"),
                WardrobeItem(name: "Pants", category: "Pants", color: "Black"),
                WardrobeItem(name: "Skirt", category: "Skirt", color: "Yellow"),
                WardrobeItem(name: "Sneakers", category: "Sepatu", color: "White"),
                WardrobeItem(name: "Flip Flops", category: "Sandal", color: "Green")
            ].forEach(container.mainContext.insert)
            
            return container
        } catch {
            fatalError("Failed to create model container for previewing: \(error.localizedDescription)")
        }
        
    }()
}
