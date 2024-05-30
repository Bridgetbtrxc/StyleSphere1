//
//  Event.swift
//  StyleSphere
//
//  Created by MacBook Pro on 30/05/24.
//

import SwiftUI

class Event: Identifiable {
    var id = UUID()
    var title: String
    var date: String
    
    init(title: String, date: String) {
        self.title = title
        self.date = date
    }
}

