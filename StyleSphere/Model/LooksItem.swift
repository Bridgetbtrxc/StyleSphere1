//
//  LooksItem.swift
//  StyleSphere
//
//  Created on 05/06/24.
//

import Foundation
import SwiftData

@Model class LooksItem {
    var name: String
    var items: [WardrobeItem] = []
    
    init(name: String) {
        self.name = name
    }
    
    convenience init(name: String, items: [WardrobeItem]) {
        self.init(name: name)
        self.items = items
    }
}
