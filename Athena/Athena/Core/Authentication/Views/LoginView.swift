//
//  LoginView.swift
//  Athena
//
//  Created by Tshimega Belmont on 2022/09/25.
//

import SwiftUI

struct LoginView: View {
    @State private var email = ""
    @State private var password = ""
    
    var body: some View {
//        parent container
        VStack {
            
//            header view
            VStack(alignment: .center) {
                
                Image("login")
                    .padding(/*@START_MENU_TOKEN@*/.top, 10.0/*@END_MENU_TOKEN@*/)
                    
                
                Text("Log In")
                    .font(.largeTitle)
                    .fontWeight(.semibold)
                    .foregroundColor(Color("PrimaryTextColor"))
                    .padding(.top, -2.0)
            }
            
            VStack (spacing: 10) {
                TextField("Enter your email", text: $email)
                    .frame(height: 67)
                    .background(Color.theme.pink)
                    .cornerRadius(15)
                
                TextField("Enter your password", text: $password)
                    .frame(height: 67)
                    .background(Color.theme.pink)
                    .cornerRadius(15)
            }
            .padding(.horizontal, 30)
            .padding(.top, 64)
            
            HStack {
                Spacer()
                
                NavigationLink {
                    Text("Reset Password")
                } label: {
                    Text("Forgot Password?")
                        .font(.caption)
                        .fontWeight(.semibold)
                        .foregroundColor(Color.theme.accent)
                        .padding(.top)
                        .padding(.trailing, 30)
                }
            }
            
            Spacer()
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
