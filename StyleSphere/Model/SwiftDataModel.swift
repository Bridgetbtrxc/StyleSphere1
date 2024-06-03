//
//  SwiftDataModel.swift
//  StyleSphere
//
//  Created by Macbook on 02/06/24.
//

import Foundation
import SwiftData
import SwiftUI
import UIKit

@MainActor
final class SwiftDataModel {
    static let container: ModelContainer = {
        do {
            let config = ModelConfiguration(isStoredInMemoryOnly: true)
            
            let placeholderUIImage = UIImage(named: "Wardrobe1") ?? UIImage() // Using a fallback empty image
            let placeholderImageData: Data = placeholderUIImage.pngData() ?? Data()  // Ensures that we have some data even if pngData fails
            
            
            let container = try ModelContainer(for: WardrobeItem.self, configurations: config)
            [
                WardrobeItem(name: "T-Shirt", category: "Baju", color: "Red", image: placeholderImageData),
                WardrobeItem(name: "Striped Shirt", category: "Shirt", color: "Blue", image: placeholderImageData),
                WardrobeItem(name: "Pants", category: "Pants", color: "Black", image: placeholderImageData),
                WardrobeItem(name: "Skirt", category: "Skirt", color: "Yellow", image: placeholderImageData),
                WardrobeItem(name: "Sneakers", category: "Sepatu", color: "White", image: placeholderImageData),
                WardrobeItem(name: "Flip Flops", category: "Sandal", color: "Green", image: placeholderImageData)
            ].forEach(container.mainContext.insert)
            
            return container
        } catch {
            fatalError("Failed to create model container for previewing: \(error.localizedDescription)")
        }
        
    }()
}
