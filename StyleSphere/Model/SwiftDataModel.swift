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
            let categories = WardrobeItem.categories
            let commonColors = ["Red", "Green", "Blue", "Yellow", "Black", "White", "Gray", "Brown", "Purple", "Orange"]
            let container = try ModelContainer(for: WardrobeItem.self, LooksItem.self, CalendarEvent.self, configurations: config)
            categories.forEach { category in
                for i in 1..<5 {
                    let wardrobe = WardrobeItem(name: "Placeholder \(i)",
                                                category: category,
                                                color: commonColors.randomElement() ?? "Red",
                                                image: placeholderImageData
                    )
                    container.mainContext.insert(wardrobe)
                }
            }
            
            
            for i in 1..<5 {
                let wardrobes = try container.mainContext.fetch(FetchDescriptor<WardrobeItem>())
                let randomWardrobePrefix = wardrobes.shuffled().prefix(3)
                let look = LooksItem(name: "Look \(i)", items: Array(randomWardrobePrefix))
                container.mainContext.insert(look)
            }
            
            for i in 1..<5 {
                let randomEventsName = ["Meeting", "Party", "Dinner", "Work", "Gym"].randomElement() ?? "Meeting"
                let looks = try container.mainContext.fetch(FetchDescriptor<LooksItem>())
                let randomLook = looks.shuffled().first
                
                for j in 1...Int.random(in: 2...5) {
                    let day = Calendar.current.date(byAdding: .day, value: i, to: Date()) ?? Date()
                    let event = CalendarEvent(title: randomEventsName, date: day, look: randomLook!)
                    container.mainContext.insert(event)
                }
            }
            
            return container
        } catch {
            fatalError("Failed to create model container for previewing: \(error.localizedDescription)")
        }
        
    }()
}
