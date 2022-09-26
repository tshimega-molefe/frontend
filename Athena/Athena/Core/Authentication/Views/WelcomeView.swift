//
//  WelcomeView.swift
//  Athena
//
//  Created by Tshimega Belmont on 2022/09/26.
//

import SwiftUI

struct WelcomeView: View {
    var body: some View {
        ZStack {
            
            //            UIView Background Color
            
            Color.theme.background
                .edgesIgnoringSafeArea(.all)
            
            //            Parent VStack
            
            VStack {
                //            AuthHeaderView
                
              Image("welcome")
                    .padding(.top, 30)
                
                Text("Get help when you need it")
                    .font(.custom(FontsManager.Poppins.semiBold, size: 28))
                    .foregroundColor(Color.theme.secondaryText)
                    .padding(.top, 30)
                
                Text("Your own A.I. security assistant")
                    .font(.custom(FontsManager.Poppins.regular, size: 20))
                    .foregroundColor(Color.theme.grey)
                    .padding(.top, 3)
                
                Spacer()
                    
            }
        }
    }
}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView()
    }
}
