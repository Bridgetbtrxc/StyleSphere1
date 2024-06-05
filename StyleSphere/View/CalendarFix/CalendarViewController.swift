//
//  ViewController.swift
//  StyleSphere
//
//  Created by MacBook Pro on 05/06/24.
//
import UIKit
import CalendarKit
import EventKit

class CalendarViewController: DayViewController {
    private let eventStore = EKEventStore()

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Calendar"
        requestAccessToCalendar()
    }

    func requestAccessToCalendar(){
        eventStore.requestAccess(to: .event) { success, error in

        }
    }
}
