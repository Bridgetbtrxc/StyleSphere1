//
//  WardrobeItem.swift
//  StyleSphere
//
//  Created by MacBook Pro on 29/05/24.
//

import Foundation
import SwiftData

struct WardrobeItem: Identifiable {
    var id = UUID()
    var category: String
    var name: String
    var color: String
    
    init(id: UUID = UUID(), category: String, name: String, color: String) {
        self.id = id
        self.category = category
        self.name = name
        self.color = color
    }
}
