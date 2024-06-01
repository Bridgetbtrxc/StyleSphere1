//  AddEvent.swift
//  StyleSphere
//
//  Created by MacBook Pro on 30/05/24.
//

import SwiftUI

struct AddEvent: View {
    @State private var eventTitle = ""
    @State private var selectedDate = Date()
    @State private var isDatePickerVisible = false
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 30) {
                HStack(alignment: .top) {
                  
                    Spacer()
                    Text("Add Event")
                        .font(Font.custom("Inter", size: 18).weight(.medium))
                        .foregroundColor(Color(red: 0.42, green: 0.31, blue: 0.22))
                    Spacer()
                }
                .padding()
                
                Text("Add New Event")
                    .font(Font.custom("Inter", size: 20).weight(.heavy))
                    .foregroundColor(Color(red: 0.42, green: 0.31, blue: 0.22))
                    .padding(.leading)
                
                VStack(alignment: .leading, spacing: 16) {
                    Text("Event Title")
                        .font(Font.custom("Inter", size: 16).weight(.heavy))
                        .foregroundColor(Color(red: 0.42, green: 0.31, blue: 0.22))
                        .padding(.leading)
                    
                    TextField("Add Title", text: $eventTitle)
                        .padding(.horizontal)
                        .frame(height: 50)
                        .background(
                            RoundedRectangle(cornerRadius: 20)
                                .stroke(Color(red: 0.93, green: 0.90, blue: 0.85), lineWidth: 1)
                                .background(
                                    RoundedRectangle(cornerRadius: 16)
                                        .fill(Color(red: 0.93, green: 0.90, blue: 0.85))
                                )
                        )
                        .padding(.horizontal)
                    
                    Text("Event Date")
                        .font(Font.custom("Inter", size: 16).weight(.heavy))
                        .foregroundColor(Color(red: 0.42, green: 0.31, blue: 0.22))
                        .padding(.leading)
                    
                    VStack {
                        Button(action: {
                            isDatePickerVisible.toggle()
                        }) {
                            Text(selectedDate, style: .date)
                                .font(.headline)
                                .foregroundColor(Color(red: 0.42, green: 0.31, blue: 0.22))
                                .padding()
                                .background(
                                    RoundedRectangle(cornerRadius: 20)
                                        .stroke(Color(red: 0.93, green: 0.90, blue: 0.85))
                                        .background(
                                            RoundedRectangle(cornerRadius: 16)
                                                .fill(Color(red: 0.93, green: 0.90, blue: 0.85))
                                                .padding(.leading, 10)
                                        )
                                )
                        }
                        
                        if isDatePickerVisible {
                            DatePicker("", selection: $selectedDate, displayedComponents: .date)
                                .labelsHidden()
                                .datePickerStyle(GraphicalDatePickerStyle())
                                .padding(.leading)
                                .background(
                                    RoundedRectangle(cornerRadius: 20)
                                        .stroke(Color(red: 0.93, green: 0.90, blue: 0.85), lineWidth: 1)
                                        .background(
                                            RoundedRectangle(cornerRadius: 16)
                                                .fill(Color(red: 0.93, green: 0.90, blue: 0.85))
                                        )
                                )
                                .padding(.horizontal)
                        }
                    }
                    
                    Spacer()
                    
                    Button(action: {
                        // Action to add event
                    }) {
                        Text("Add")
                            .font(Font.custom("Inter", size: 16).weight(.heavy))
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color(red: 0.42, green: 0.31, blue: 0.22))
                            .cornerRadius(16)
                            .padding(.horizontal)
                    }
                }
            }
            .padding(.horizontal)
        }
    }
}

#Preview {
    AddEvent()
}
