//
//  NotificationManager.swift
//  LocalNotification
//
//  Created by Skorobogatow, Christian on 4/7/22.
//

import SwiftUI
import UserNotifications
import CoreLocation


class NotificationManager {
    
    static let instance = NotificationManager()
    
    func requestAuthorization() {
        let options: UNAuthorizationOptions = [.sound,
                                               .alert,
                                               .badge ]
        
        UNUserNotificationCenter.current().requestAuthorization(options: options) { success, error in
            if let error = error {
                print("ERROR: \(error.localizedDescription)")
            } else {
                print("SUCCESS")
            }
        }
    }
    
    
    
    func scheduleTimeNotification() {
        let content = UNMutableNotificationContent()
        content.title = "This is a notification"
        content.subtitle = "Easy Peas Lemon Squeasy"
        content.sound = .default
        content.badge =  1
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5.0,
                                                        repeats: false)

        let request = UNNotificationRequest(identifier: UUID().uuidString,
                                            content: content,
                                            trigger: trigger)
        
        UNUserNotificationCenter.current().add(request)
    }
    
    
    func scheduleCalendarNotification() {
        let content = UNMutableNotificationContent()
        content.title = "This is a notification"
        content.subtitle = "Easy Peas Lemon Squeasy"
        content.sound = .default
        content.badge =  1
        
        var dateComponents = DateComponents()
        dateComponents.hour = 13
        dateComponents.minute = 29
        dateComponents.weekday = 2
        
        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents,
                                                    repeats: true)

        let request = UNNotificationRequest(identifier: UUID().uuidString,
                                            content: content,
                                            trigger: trigger)
        
        UNUserNotificationCenter.current().add(request)
    }
    
    
    func scheduleLocationNotification() {
        let content = UNMutableNotificationContent()
        content.title = "This is a notification"
        content.subtitle = "Easy Peas Lemon Squeasy"
        content.sound = .default
        content.badge =  1
        
        
        let coordinates = CLLocationCoordinate2D(latitude: 40.00,
                                                 longitude: 50.00)
        
        let region = CLCircularRegion(center: coordinates,
                                      radius: 100,
                                      identifier: UUID().uuidString)
        region.notifyOnEntry = true
        region.notifyOnExit = false
        
        let trigger = UNLocationNotificationTrigger(region: region,
                                                    repeats: true)
        
        let request = UNNotificationRequest(identifier: UUID().uuidString,
                                            content: content,
                                            trigger: trigger)
        
        UNUserNotificationCenter.current().add(request)
    }
    
    
    func cancelNotification() {
        UNUserNotificationCenter.current().removeAllPendingNotificationRequests()
        UNUserNotificationCenter.current().removeAllDeliveredNotifications()
    }
}
