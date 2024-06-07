import SwiftUI
import SwiftData

struct NewCalendarView: View {
    @Environment(\.dismiss) var dismiss
    @Environment(\.modelContext) var modelContext
    @Query var looks: [LooksItem]
    @State var selectedLook: LooksItem?
    @State var date: Date = .now
    @State var name = ""
    
    let grid: [GridItem] = Array(repeating: .init(.flexible()), count: 2)
    
    var body: some View {
        Form {
            Section("Event Detail") {
                DatePicker("Date of event", selection: $date, displayedComponents: [.date])
                    .datePickerStyle(.graphical)
                
                TextField("Event name", text: $name)
            }
            
            Section("Pick your look") {
                LazyVGrid(columns: grid, spacing: 20) {
                    ForEach(looks) { look in
                        VStack {
                            LookCardView(look: look)
                            if look == selectedLook {
                                Label("Selected", systemImage: "checkmark.circle.fill")
                            } else {
                                Label("Select", systemImage: "circle")
                            }
                        }.onTapGesture {
                            selectedLook = look
                        }
                    }
                    
                }
            }
            
            Button("Add to calendar") {
                guard let selectedLook else { return }
                let calendarItem = CalendarEvent(title: name, 
                                                 date: date,
                                                 look: selectedLook)
                
                modelContext.insert(calendarItem)
                dismiss()
            }
        }
        .navigationTitle("New Calendar")
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarTitleTextColor(.subColor)
    }
}

#Preview {
    NavigationStack {
        NewCalendarView()
    }.modelContainer(SwiftDataModel.container)
}
