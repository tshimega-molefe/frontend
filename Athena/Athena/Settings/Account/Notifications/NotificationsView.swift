//
//  NotificationsView.swift
//  Athena
//
//  Created by Tshimega Belmont on 2023/01/13.
//

import SwiftUI

struct NotificationsView: View {
    
    @State private var messageNotifications : Bool = true
    @State private var watchMeNotifications: Bool = true
    @State private var statusNotifications: Bool = true
    
    
    var body: some View {
        List {
            Section {
                Toggle(isOn: $messageNotifications) {
                    Text("Push Notifications")
                }
                NavigationLink {
                    Text("Notitification Sound List")
                } label: {
                    Text("Sound")
                }
                
            } header: {
                Text("Message Notifications")
            }
            
            Section {
                Toggle(isOn: $watchMeNotifications) {
                    Text("Push Notifications")
                }
                NavigationLink {
                    Text("Notification Sound List")
                } label: {
                    Text("Sound")
                }
                Toggle(isOn: $statusNotifications) {
                    Text("Status Notifications")
                }
            } header: {
                Text("Watch-Me Notifications")
            }
            
            Section {
                
                NavigationLink {
                    Text("In-App Notifications Page")
                } label: {
                    VStack(alignment: .leading) {
                        Text("In-App Notifications")
                        Text("Banners, Sounds, Vibrate")
                            .font(.caption)
                    }
                }
                
                
            } header: {}
            Section {
                Button {
                    print("DEBUG: Bring up a call-to-action, which resets notification settings...")
                } label: {
                    Text("Reset Notification Settings")
                        .foregroundColor(.red)
                }

                
               
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
