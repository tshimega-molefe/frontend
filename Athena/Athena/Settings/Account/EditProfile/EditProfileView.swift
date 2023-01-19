//
//  EditProfileView.swift
//  Athena
//
//  Created by Tshimega Belmont on 2023/01/19.
//

import SwiftUI

struct EditProfileView: View {
    
    @State private var name: String = ""
    @State private var email: String = ""
    @State private var profileImage: Image?
    
    var body: some View {
        Form {
            Section(header: Text("Name")) {
                TextField("Enter your name", text :$name)
            }
            Section(header: Text("Email")) {
                TextField("Enter your email", text: $email)
            }
            Section(header: Text("Profile Picture")) {
                if profileImage != nil {
                    profileImage?
                        .resizable()
                        .frame(width: 100, height: 100)
                } else {
                    Button(action: {
                        // Select image from libarary or take photo
                    }) {
                        Text("Select Profile Image")
                    }
                }
            }
            Section {
                Button(action: {
                    // Save PROFILE  INFORMATION
                }) {
                    Text("Save")
                }
            }
        }
        .navigationTitle("Edit Profile")
    }
}


struct EditProfileView_Previews: PreviewProvider {
    static var previews: some View {
        EditProfileView()
    }
}
