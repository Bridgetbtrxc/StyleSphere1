//
//  WardrobeItem.swift
//  StyleSphere
//
//  Created by MacBook Pro on 29/05/24.
//

import Foundation
import SwiftData

@Model
class WardrobeItem {
    var id: UUID = UUID()
    var category: String
    var name: String
    var color: String

    init(name: String, category: String, color: String) {
        self.name = name
        self.category = category
        self.color = color
    }
}
