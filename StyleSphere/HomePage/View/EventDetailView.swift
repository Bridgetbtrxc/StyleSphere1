//  EventDetailView.swift
//  StyleSphere
//
//  Created by MacBook Pro on 30/05/24.
//

import SwiftUI

struct EventDetailView: View {
    var event: Event
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                Text(event.title)
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(Color(red: 0.42, green: 0.31, blue: 0.22))
                
                Text("Date: \(event.date)")
                    .font(.headline)
                    .foregroundColor(.gray)
                
                Divider() // Add a horizontal divider
            }
            .padding()
        }
        .navigationBarTitle(event.title)
        .navigationBarTitleDisplayMode(.inline)
        .foregroundColor(Color(red: 0.42, green: 0.31, blue: 0.22))
    }
}
