//
//  EditProfileView.swift
//  Athena
//
//  Created by Tshimega Belmont on 2023/01/19.
//

import SwiftUI
import ComposableArchitecture

struct EditProfileView: View {
    
    let store: StoreOf<SettingsFeature>
    @ObservedObject var viewStore: ViewStoreOf<SettingsFeature>
    
    init(store: StoreOf<SettingsFeature>) {
        self.store = store
        self.viewStore = ViewStore(self.store)
    }
    
    var body: some View {
        List {
            Section {
                VStack(alignment: .leading) {
                    HStack (alignment: .center){
                        Image("sabrina")
                            .resizable()
                            .frame(width: 58, height: 58)
                            .clipShape(Circle())
                        
                        Text("Enter your name and add an optional profile picture")
                            .foregroundColor(Color.theme.secondaryText)
                            .font(.custom(FontsManager.Poppins.light, size: 12))
                        
                    }
                    NavigationLink {
                        ProfilePhotoView(image: Image("sabrina"))
                    } label: {
                        Text("Edit").foregroundColor(.blue)
                            .font(.custom(FontsManager.Poppins.semiBold, size: 14))
                            .padding(.leading)
                    }
                }
            }
            
            
            Section {
                TextField("Type here", text: viewStore.binding(\.profile.$userProfile.full_name))
                    .disabled(!viewStore.profile.isEditing)
                    .autocorrectionDisabled(true)
            } header: {
                Text("Full Name")
            }
            Section {
                NavigationLink {
                    Text("LocationSearchVIew")
                } label: {
                    Text("11 Spring Road, Douglasdale")
                }
            } header: {
                Text("Home Address")
            }
            Section {
                Text(viewStore.profile.userProfile.contact_number ?? "+27 86 758 6250")
            } header: {
                Text("Phone Number")
            }
            Section {
                Text(viewStore.profile.userProfile.user.email)
            } header: {
                Text("Email")
            }
        }
        .navigationBarItems(leading: viewStore.profile.isEditing ? Button(action: {
            viewStore.send(.profile(.cancelChanges))
        }, label: {
            Text("Cancel")
        }) : nil, trailing: viewStore.profile.isEditing ? Button(action: {
            viewStore.send(.profile(.saveChanges))
        }, label: {
            Text("Save")
        }): Button(action: {
            viewStore.send(.profile(.editProfile))
        }, label: {
            Text("Edit")
        })
        )
        .navigationBarBackButtonHidden(viewStore.profile.isEditing)
        .listStyle(.inset)
        .navigationTitle("Edit Profile")
        .navigationBarTitleDisplayMode(.inline)
    }
}

func selectImage() {
    let picker = UIImagePickerController()
    picker.sourceType = .photoLibrary
    
    UIApplication.shared.windows.first?.rootViewController?.present(picker,animated: true)
}


struct EditProfileView_Previews: PreviewProvider {
    static var previews: some View {
        EditProfileView(store: Store(initialState: SettingsFeature.State(profile: ProfileFeature.State()),
                                     reducer: AnyReducer(SettingsFeature()),
                                     environment: ()))
    }
}
