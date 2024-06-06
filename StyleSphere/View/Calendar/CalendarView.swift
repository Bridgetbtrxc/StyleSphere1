//
//  CalendarView.swift
//  StyleSphere
//
//  Created by Rama Adi Nugraha on 06/06/24.
//

import SwiftUI
import SwiftData

struct CalendarView: View {
    @Query var events: [CalendarEvent]
    
    @State var eventsDates: [String] = []
    @State var eventsByDate: [String: [CalendarEvent]] = [:]
    
    var body: some View {
        NavigationStack {
            Group{
                if events.isEmpty {
                    ContentUnavailableView("No events added",
                                           systemImage: "hanger",
                                           description: Text("Add a new event to start")
                    )
                } else {
                    eventList
                        .onAppear(perform: groupEvents)
                        .listStyle(.inset)
                }
            }
            .navigationTitle("Calendar")
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarTitleTextColor(.subColor)
            .toolbar {
                ToolbarItem(placement: .primaryAction) {
                    addButton
                }
            }
        }
    }
    
    private var eventList: some View {
        List {
            ForEach(eventsDates, id: \.self) { date in
                eventSection(for: date)
            }
        }
    }
    
    @ViewBuilder
    private func eventSection(for date: String) -> some View {
        Section(date) {
            ForEach(eventsByDate[date] ?? [], id: \.id) { event in
                EventRow(event: event)
            }
        }
    }
    
    private var addButton: some View {
        NavigationLink(destination: NewCalendarView()) {
            Label("Add new event", systemImage: "plus")
        }
    }
    
    private func formatDate(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeZone = TimeZone(secondsFromGMT: 0)
        formatter.locale = Locale(identifier: "en_US")
        return formatter.string(from: date)
    }
    
    private func groupEvents() {
        eventsDates = []
        eventsByDate = [:]
        
        let sortedEvents = events.sorted { $0.date > $1.date }
        for event in sortedEvents {
            let date = formatDate(event.date)
            if eventsByDate[date] == nil {
                eventsDates.append(date)
                eventsByDate[date] = [event]
            } else {
                eventsByDate[date]!.append(event)
            }
        }
    }
    
    struct EventRow: View {
        var event: CalendarEvent
        
        var body: some View {
            HStack {
                VStack(alignment: .leading, spacing: 5) {
                    Text(event.title).font(.headline)
                    HStack {
                        Image(systemName: "hanger")
                        Text(event.look.name)
                    }.font(.subheadline)
                }
                Spacer()
                
                NavigationLink(destination: LooksView()) {
                    EmptyView()
                }
            }
        }
    }
    
}

#Preview {
    CalendarView().modelContainer(SwiftDataModel.container)
}
