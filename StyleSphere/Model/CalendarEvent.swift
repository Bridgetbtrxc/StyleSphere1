//
//  CalendarEvent.swift
//  StyleSphere
//
//  Created by MacBook Pro on 30/05/24.
//

import Foundation
import SwiftData

@Model
class CalendarEvent {
    var title: String
    var date: Date
    var look: LooksItem
    
    init(title: String, date: Date, look: LooksItem) {
        self.title = title
        self.date = date
        self.look = look
    }
}

