//
//  EventShowcaseView.swift
//  StyleSphere
//
//  Created by MacBook Pro on 30/05/24.
//

import SwiftUI

struct EventShowcaseView: View {
    var events: [Event] = [
        Event(title: "Birthday Party", date: "June 15, 2024"),
        Event(title: "Conference", date: "July 10, 2024"),
        Event(title: "Meeting", date: "August 5, 2024"),
        Event(title: "Workshop", date: "September 20, 2024"),
        Event(title: "Networking Event", date: "October 12, 2024")
    ]
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHStack(spacing: 20) {
                ForEach(events) { event in
                    NavigationLink(destination: EventDetailView(event: event)) {
                        EventCard(event: event)
                    }
                }
            }
            .padding(.horizontal, 20)
        }
        .shadow(radius: 3)
        .navigationBarTitle("Events")
        .navigationBarTitleTextColor(Color(red: 0.42, green: 0.31, blue: 0.22))
    }
}

#Preview {
    EventShowcaseView()
}
