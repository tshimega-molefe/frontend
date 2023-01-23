//
//  EditProfileView.swift
//  Athena
//
//  Created by Tshimega Belmont on 2023/01/19.
//

import SwiftUI
import ComposableArchitecture

struct EditProfileView: View {
    let store: Store<EditProfileFeature.State, EditProfileFeature.Action>
    
    @State private var name: String = ""
    @State private var email: String = ""
    @State private var profileImage: Image?
    @State private var showSaveButton: Bool = false
    @State private var showCancelButton: Bool = false
    
    var body: some View {
        WithViewStore(self.store) { viewStore in
            List {
                Section() {
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
                    
                    TextField("Your name", text: $name, onEditingChanged: { editing in
                        self.showSaveButton = editing
                    })
                    .navigationBarItems(leading: showCancelButton ? Button(action: {
                        viewStore.send(.cancelChanges)
                    }, label: {
                        Text("Cancel")
                    }): nil, trailing: showSaveButton ? Button(action: {
                        viewStore.send(.saveChanges)
                    }, label: {
                        Text("Save")
                    }): nil
                    )
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
                    Text("+27 86 758 6250")
                } header: {
                    Text("Phone Number")
                }

                
                Section {
                    Text("sabrinamorreno@gmail.com")
                } header: {
                    Text("Email")
                }
                
            }
            .listStyle(.inset)
            .navigationTitle("Edit Profile")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
    
    func selectImage() {
        let picker = UIImagePickerController()
        picker.sourceType = .photoLibrary
//        picker.delegate = self
        
        UIApplication.shared.windows.first?.rootViewController?.present(picker,animated: true)
    }
}

//extension EditProfileView: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
//    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
//        if let pickedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
//            profileImage = Image(uiImage: pickedImage)
//        }
//        picker.dismiss(animated: true)
//    }
//}



struct EditProfileView_Previews: PreviewProvider {
    static var previews: some View {
        EditProfileView(store: Store(initialState: EditProfileFeature.State(),
                                     reducer: AnyReducer(EditProfileFeature()),
                                     environment: ()))
    }
}
