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
    @State private var isShowingAddEvent = false
    
    var body: some View {
        ScrollView(.vertical) {
            VStack(spacing: 35) {
                let days: [String] = ["Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"]
                
                VStack(spacing: 20) {
                    HStack {
                        Spacer()
                        Text(extraDate()[0])
                            .font(.system(size: 18, weight: .semibold))
                            .foregroundColor(Color(red: 0.42, green: 0.31, blue: 0.22))
                        Spacer()
                    }
                    
                    HStack {
                        Spacer()
                        Text(extraDate()[1])
                            .font(.system(size: 24, weight: .bold))
                            .foregroundColor(Color(red: 0.42, green: 0.31, blue: 0.22))
                        Spacer()
                    }
                    
                    HStack {
                        Spacer()
                        Button {
                            withAnimation {
                                currentMonth -= 1
                            }
                        } label: {
                            Image(systemName: "chevron.left")
                                .font(.title2)
                                .foregroundColor(Color(red: 0.42, green: 0.31, blue: 0.22))
                        }
                        
                        Spacer()
                        
                        Button {
                            withAnimation {
                                currentMonth += 1
                            }
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
                            if value.day != -1 {
                                Text("\(value.day)")
                                    .font(.title3.bold())
                                    .foregroundColor(isToday(date: value.date) ? Color(red: 0.42, green: 0.31, blue: 0.22) : Color(red: 0.42, green: 0.31, blue: 0.22))
                                    .background(isToday(date: value.date) ? Color(red: 0.36, green: 0.25, blue: 0.20).opacity(0.3) : Color.clear)
                                    .cornerRadius(10)
                            } else {
                                Text("")
                                    .font(.title3.bold())
                                    .foregroundColor(.clear)
                            }
                        }
                    }
                }
                EventShowcaseView()
                
            }
            .padding(.top, 20) // Add padding to move the button higher
            
            // Add button to navigate to AddEvent page
            Button(action: {
                isShowingAddEvent = true
            }) {
                Text("Add Event")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .background(Color(red: 0.42, green: 0.31, blue: 0.22))
                    .cornerRadius(16)
                    .frame(width: 300)
            }
            .sheet(isPresented: $isShowingAddEvent) {
                AddEvent()
            }
            
        }
        .onChange(of: currentMonth) { newValue in
            currentDate = getCurrentMonth()
        }
    }
    
    // Year and month display
    func extraDate() -> [String] {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy MMMM"
        
        let date = formatter.string(from: getCurrentMonth())
        
        return date.components(separatedBy: " ")
    }
    
    func getCurrentMonth() -> Date {
        let calendar = Calendar.current
        
        guard let currentMonth = calendar.date(byAdding: .month, value: self.currentMonth, to: currentDate) else {
            return Date()
        }
        return currentMonth
    }
    
    func extractDate() -> [DateValue] {
        let calendar = Calendar.current
        let currentMonth = getCurrentMonth()
        
        var days = currentMonth.getAllDates().compactMap { date -> DateValue in
            let day = calendar.component(.day, from: date)
            return DateValue(day: day, date: date)
        }
        
        let firstWeekday = calendar.component(.weekday, from: days.first?.date ?? Date())
        
        for _ in 0..<firstWeekday - 1 {
            days.insert(DateValue(day: -1, date: Date()), at: 0)
        }
        
        return days
    }
    
    func isToday(date: Date) -> Bool {
        let calendar = Calendar.current
        return calendar.isDateInToday(date)
    }
}

struct CalendarView_Previews: PreviewProvider {
    static var previews: some View {
        CalendarView(currentDate: .constant(Date()))
    }
}

// Extensions and utility functions
extension Date {
    func getAllDates() -> [Date] {
        let calendar = Calendar.current
        let startDate = calendar.date(from: calendar.dateComponents([.year, .month], from: self))!
        let range = calendar.range(of: .day, in: .month, for: startDate)!
        
        return range.compactMap { day -> Date in
            calendar.date(byAdding: .day, value: day - 1, to: startDate)!
        }
    }
}
