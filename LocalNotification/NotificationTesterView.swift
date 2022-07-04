//
//  ContentView.swift
//  LocalNotification
//
//  Created by Skorobogatow, Christian on 4/7/22.
//

import SwiftUI
import UserNotifications
import CoreLocation


struct NotificationTesterView: View {
    var body: some View {
        VStack(spacing: 40) {
            Button("Request Permission") {
                NotificationManager.instance.requestAuthorization()
                print("Requesting Permission for Notifications")
            }
            
            Button("Schedule Notification") {
                NotificationManager.instance.scheduleTimeNotification()
                print("Scheduling Notifications based on Time")
            }
            
            Button("Schedule Calendar Notification") {
                NotificationManager.instance.scheduleCalendarNotification()
                print("Scheduling Notifications based on Date")
            }
            
            Button("Schedule Location Notification") {
                NotificationManager.instance.scheduleLocationNotification()
                print("Scheduling Notifications based on Location")
            }
            
            Button("Cancel Notification") {
                NotificationManager.instance.cancelNotification()
                print("Cancelling Notifications")
            }
        }
        .onAppear{
            UIApplication.shared.applicationIconBadgeNumber = 0
        }
    }
}

struct NotificationTesterView_Previews: PreviewProvider {
    static var previews: some View {
        NotificationTesterView()
    }
}
