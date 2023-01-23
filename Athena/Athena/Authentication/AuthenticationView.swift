//
//  AuthenticationView.swift
//  Athena
//
//  Created by Dev Jacobson on 2023/01/23.
//

import SwiftUI
import ComposableArchitecture

struct AuthenticationView: View {
    @ObservedObject var viewStore: ViewStore<AuthenticationFeature.State, AuthenticationFeature.Action>
    let store: Store<AuthenticationFeature.State, AuthenticationFeature.Action>
    
    init(store: Store<AuthenticationFeature.State, AuthenticationFeature.Action>) {
        self.store = store
        self.viewStore = ViewStore(self.store)
    }
    
    var body: some View {
        
        VStack {
            switch viewStore.state.route {
            
            /*
             ------------
              login view
             ------------
             */
            case .login:
                ZStack {
                    Color.theme.background.edgesIgnoringSafeArea(.all)
                    
                    VStack {
                        
                        AuthHeaderView(authImage: UIImage(imageLiteralResourceName: "login"), authLabel: "Log In")
                        VStack (spacing: 10) {
                            CustomInputField(inputType: .text,
                                             placeholderText: "Username",
                                             text: viewStore.binding(get: \.username, send: AuthenticationFeature.Action.usernameChanged))
                            
                            CustomInputField(inputType: .secure,
                                             placeholderText: "Password",
                                             text: viewStore.binding(get: \.password, send: AuthenticationFeature.Action.passwordChanged))
                            
                        }
                        .padding(.horizontal, 30)
                        .padding(.top, 64)
                        
                        HStack (alignment: .center){
                            Spacer()
                            
                            NavigationLink {
                                Text("Reset Password")
                            } label: {
                                Text("Forgot Password?")
                                    .font(.custom(FontsManager.Poppins.regular, size: 15))
                                    .foregroundColor(Color.theme.accent)
                            }
                        }
                        .padding(.horizontal, 30)
                        .padding(.top)
                        
                        if(viewStore.username.isEmpty || viewStore.password.isEmpty){
                            Button(action: {
                                print("DEBUG: There is missing information in either of the log in fields..")
                            }, label: {
                                Text("Log In")
                                    .font(.custom(FontsManager.Poppins.semiBold, size: 16))
                                    .foregroundColor(.white)
                                    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 67)
                                    .background(Color(.systemGray6))
                                    .cornerRadius(15)
                            })
                            .padding(.top, 40)
                            .padding(.horizontal, 30)
                        } else {
                            AuthButtonView(buttonLabel: "Log In") {
                                viewStore.send(.loginButtonTapped)
                            }
                            //                    .alert("Failed to log in", isPresented: $userAuth.invalid, actions: {
                            //                        Button("Dismiss") {
                            //                            print("DEBUG: You've entered incorrect details..")
                            //                        }
                            //                    })
                            .padding(.top, 40)
                        }
                        
                        Spacer()
                    }
                }
                .onTapGesture {
                    dismissKeyboard()
                }
            
            /*
             -------------------
              registration view
             -------------------
             */
                
            case .register:
                ZStack {
                    Color.theme.background.edgesIgnoringSafeArea(.all)
                    
                    VStack {
                        AuthHeaderView(authImage: UIImage(imageLiteralResourceName: "register"), authLabel: "Create Account")
                        
                        VStack (spacing: 10) {
                            CustomInputField(inputType: .text,
                                             placeholderText: "Username",
                                             text: viewStore.binding(get: \.username, send: AuthenticationFeature.Action.usernameChanged))
                            
                            CustomInputField(inputType: .text,
                                             placeholderText: "Email",
                                             text: viewStore.binding(get: \.email, send: AuthenticationFeature.Action.emailChanged))
                            
                            CustomInputField(inputType: .secure,
                                             placeholderText: "Password",
                                             text: viewStore.binding(get: \.password, send: AuthenticationFeature.Action.passwordChanged))
                        }
                        .padding(.horizontal, 30)
                        
                        HStack (alignment: .center) {
                            CheckBoxView(checked: viewStore.binding(get: \.tcAccepted, send: AuthenticationFeature.Action.tcCheckboxToggle))
                            
                            Text("I agree to the")
                                .font(.custom(FontsManager.Poppins.regular, size: 15))
                                .foregroundColor(Color.theme.grey)
                            
                            NavigationLink {
                                Text("Terms & Conditions")
                                
                            } label: {
                                Text("Terms & Conditions")
                                    .font(.custom(FontsManager.Poppins.semiBold, size: 15))
                                    .foregroundColor(Color.theme.accent)
                                    .underline()
                            }
                            Spacer()
                        }
                        .padding(.horizontal, 30)
                        .padding(.top)
                        
                        if(viewStore.username.isEmpty || viewStore.email.isEmpty || viewStore.password.isEmpty || !viewStore.tcAccepted){
                            Button(action: {
                                print("DEBUG: There is missing information in either of the registration fields..")
                            }, label: {
                                Text("Create Account")
                                    .font(.custom(FontsManager.Poppins.semiBold, size: 16))
                                    .foregroundColor(.white)
                                    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 67)
                                    .background(Color(.systemGray6))
                                    .cornerRadius(15)
                            })
                            .padding(.top, 40)
                            .padding(.horizontal, 30)
                        } else {
                            AuthButtonView(buttonLabel: "Create Account") {
                                viewStore.send(.registerButtonTapped)
                            }
                            //                        .alert("Username or Email already exists. Try again.", isPresented: $userAuth.alreadyExists, actions: {
                            //                            Button("Dismiss") {
                            //                                print("DEBUG: Couldn't create account, try again...")
                            //                            }
                            //                        })
                            .padding(.top, 40)
                        }
                        
                        Spacer()
                    }
                }
                .onTapGesture {
                    dismissKeyboard()
                }
            }
            
            Button {
                viewStore.send(.toggleType)
            } label: {
                HStack {
                    
                    if viewStore.route == .login {
                        Text("Sign Up")
                    }
                    else {
                        Text("Log in")
                    }
                }
            }
        }.onAppear {
            viewStore.send(.onAppear)
        }
    }
}

struct AuthenticationView_Previews: PreviewProvider {
    static var previews: some View {
        AuthenticationView(store: Store(
            initialState: AuthenticationFeature.State(),
            reducer: AnyReducer(AuthenticationFeature()),
            environment: ()))
    }
}

