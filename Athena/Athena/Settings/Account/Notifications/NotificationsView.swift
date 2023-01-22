//
//  NotificationsView.swift
//  Athena
//
//  Created by Tshimega Belmont on 2023/01/13.
//

import SwiftUI

struct NotificationsView: View {
    var body: some View {
        List {
            Section {
                Text("Show Notifications")
                Text("Sound")
                Text("Family Notifications")
            } header: {
                Text("Message Notifications")
            }
            
            Section {
                Text("Show Notifications")
                Text("Sound")
                Text("Family Notifications")
            } header: {
                Text("Group Notifications")
            }
            
            Section {
                VStack(alignment: .leading) {
                    Text("In-App Notifications")
                    Text("Banners, Sounds, Vibrate")
                }
            } header: {}
            
            Section {
                Text("Push Notifications")
            } footer: {
                Text("")
            }
            
            Section {
                Text("Reset Notification Settings")
            } footer: {
                Text("Reset all notification settings, including custom notification settings for your chats.")
            }
            
        }
        .navigationTitle("Notifications")
    }
}

struct NotificationsView_Previews: PreviewProvider {
    static var previews: some View {
        NotificationsView()
    }
}
