//
//  WardrobeItem.swift
//  StyleSphere
//
//  Created by MacBook Pro on 29/05/24.
//

import Foundation

struct WardrobeItem: Identifiable {
    var id = UUID()
    var category: String
    var name: String
    var color: String
}
