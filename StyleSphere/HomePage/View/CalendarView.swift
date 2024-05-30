//
//  CalendarView.swift
//  StyleSphere
//
//  Created by MacBook Pro on 27/05/24.
//

import SwiftUI

struct CalendarView: View {
    @Binding var currentDate: Date
    @State private var currentMonth: Int = 0
    
    var body: some View {
        ScrollView(.vertical) {
            VStack(spacing: 35) {
                let days: [String] = ["Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"]
                
                VStack(spacing: 20) {
                    HStack {
                        Spacer()
                        Text("2024")
                            .font(.system(size: 18, weight: .semibold))
                            .foregroundColor(Color(red: 0.42, green: 0.31, blue: 0.22))
                        Spacer()
                    }
                    
                    HStack {
                        Spacer()
                        Text("May")
                            .font(.system(size: 24, weight: .bold))
                            .foregroundColor(Color(red: 0.42, green: 0.31, blue: 0.22))
                        Spacer()
                    }
                    
                    HStack {
                        Spacer()
                        Button {
                            // Action for left button
                        } label: {
                            Image(systemName: "chevron.left")
                                .font(.title2)
                                .foregroundColor(Color(red: 0.42, green: 0.31, blue: 0.22))
                        }
                        
                        Spacer()
                        
                        Button {
                            // Action for right button
                        } label: {
                            Image(systemName: "chevron.right")
                                .font(.title2)
                                .foregroundColor(Color(red: 0.42, green: 0.31, blue: 0.22))
                        }
                        
                        Spacer()
                    }
                    .padding()
                    
                    HStack(spacing: 0) {
                        ForEach(days, id: \.self) { day in
                            Text(day)
                                .font(.callout)
                                .fontWeight(.bold)
                                .frame(maxWidth: .infinity)
                                .foregroundColor(Color(red: 0.42, green: 0.31, blue: 0.22))
                        }
                    }
                    
                    let columns = Array(repeating: GridItem(.flexible()), count: 7)
                    
                    LazyVGrid(columns: columns, spacing: 15) {
                        ForEach(extractDate()) { value in
                            Text("\(value.day)")
                                .font(.title3.bold())
                                .foregroundColor(Color(red: 0.42, green: 0.31, blue: 0.22))
                        }
                    }
                }
            }
        }
    }
    
    func extractDate() -> [DateValue] {
        guard let currentMonth = Calendar.current.date(byAdding: .month, value: self.currentMonth, to: currentDate) else {
            return []
        }
        
        return currentMonth.getAllDates().compactMap { date -> DateValue in
            let day = Calendar.current.component(.day, from: date)
            return DateValue(day: day, date: date)
        }
    }
}

struct CalendarView_Previews: PreviewProvider {
    static var previews: some View {
        CalendarView(currentDate: .constant(Date()))
    }
}

extension Date {
    func getAllDates() -> [Date] {
        let calendar = Calendar.current
        let startDate = calendar.date(from: calendar.dateComponents([.year, .month], from: self))!
        let range = calendar.range(of: .day, in: .month, for: startDate)!
        
        return range.compactMap { day -> Date in
            return calendar.date(byAdding: .day, value: day - 1, to: startDate)!
        }
    }
}
