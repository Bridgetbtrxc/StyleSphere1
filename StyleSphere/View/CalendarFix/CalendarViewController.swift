////
////  ViewController.swift
////  StyleSphere
////
////  Created by MacBook Pro on 05/06/24.
////
//import UIKit
//import CalendarKit
//import EventKit
//import SwiftUI
//
//class CalendarViewController: DayViewController {
//    private let eventStore = EKEventStore()
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        title = "Calendar"
//        requestAccessToCalendar()
//    }
//
//    func requestAccessToCalendar(){
//        eventStore.requestAccess(to: .event) { success, error in
//
//        }
//    }
//}
//
//struct CalendarViewControllerRepresentable: UIViewControllerRepresentable {
//    typealias UIViewControllerType = CalendarViewController
//
//    func makeUIViewController(context: Context) -> CalendarViewController {
//        return CalendarViewController()
//    }
//
//    func updateUIViewController(_ uiViewController: CalendarViewController, context: Context) {
//        // Update the view controller if needed
//    }
//}
//
//#Preview {
//    CalendarViewControllerRepresentable()
//}
