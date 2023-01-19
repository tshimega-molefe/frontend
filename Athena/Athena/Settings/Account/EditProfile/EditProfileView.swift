//
//  EditProfileView.swift
//  Athena
//
//  Created by Tshimega Belmont on 2023/01/19.
//

import SwiftUI
import ComposableArchitecture

struct EditProfileView: View {
    @ObservedObject var viewStore: ViewStore<EditProfileFeature.State, EditProfileFeature.Action>
    let store: Store<EditProfileFeature.State, EditProfileFeature.Action>
    
    init(store: Store<EditProfileFeature.State, EditProfileFeature.Action>) {
        self.store = store
        self.viewStore = ViewStore(self.store)
    }

    @State private var name: String = ""
    @State private var email: String = ""
    @State private var profileImage: Image?
    
    var body: some View {
        
        switch viewStore.state.route {
        case .notEditing:
            List {
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
                            viewStore.send(.selectProfileImage)
                        }) {
                            Text("Select Profile Image")
                        }
                    }
                }
                Section {
                    Button(action: {
                        // Save PROFILE  INFORMATION
                        viewStore.send(.saveChanges)
                    }) {
                        Text("Save")
                    }
                }
            }
            .navigationTitle("Edit Profile")
            
        case .editing:
            Text("Editing Profile Page")
        }
    }
}


struct EditProfileView_Previews: PreviewProvider {
    static var previews: some View {
        EditProfileView(store: Store(initialState: EditProfileFeature.State(),
                                     reducer: AnyReducer(EditProfileFeature()),
                                     environment: ()))
    }
}
