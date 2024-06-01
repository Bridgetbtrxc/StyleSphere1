//
//  StyleSphereApp.swift
//  StyleSphere
//
//  Created by MacBook Pro on 23/05/24.
//

import SwiftUI
import SwiftData

@main
struct StyleSphereApp: App {
    var body: some Scene {
        WindowGroup {
            Navigation()
        }.modelContainer(for: WardrobeItem.self)
        
    }
}
