//
//  LoginView.swift
//  Athena
//
//  Created by Tshimega Belmont on 2022/09/25.
//

import SwiftUI

struct LoginView: View {
    var body: some View {
//        parent container
        VStack {
            
//            header view
            VStack(alignment: .center) {
                Text("Log In")
                    .font(.largeTitle)
                    .fontWeight(.semibold)
                    .foregroundColor(Color("PrimaryTextColor"))
                    .kerning(-1.0)

                
                Image("login")
                    .padding(.top, -5.0)

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
