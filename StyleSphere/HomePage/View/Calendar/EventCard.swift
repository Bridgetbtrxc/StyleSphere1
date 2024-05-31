//  EventCard.swift
//  StyleSphere
//
//  Created by MacBook Pro on 30/05/24.
//

import SwiftUI

struct EventCard: View {
    var event: Event
    
    var body: some View {
        VStack {
            Text(event.title)
                .font(.headline)
                .foregroundColor(Color(red: 0.42, green: 0.31, blue: 0.22))
                .padding()
                .background(Color.white)
                .cornerRadius(10)
                .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 2)
                .frame(minHeight: 100)
            
            Text(event.date)
                .font(.subheadline)
                .foregroundColor(Color(red: 0.42, green: 0.31, blue: 0.22))
                .padding(.bottom, 8)
        }
    }
}
