//
//  LocationSearchActivationView.swift
//  Athena
//
//  Created by Tshimega Belmont on 2022/10/05.
//

import SwiftUI

struct LocationSearchActivationView: View {

    var body: some View {
            
        VStack (alignment: .center, spacing: 22) {
                Text("What do you need?")
                    .foregroundColor(Color.theme.accent)
                    .font(.custom("Poppins-SemiBold", size: 20))
                
            Button {
                print("DEBUG: Handle Security Escort...")
            } label: {
                HStack {
                    ZStack {
                        Circle()
                            .fill(Color.theme.button)
                            .frame(width: 50, height: 50)
                            .shadow(radius: 6)
                        
                        Image(systemName: "house")
                            .foregroundColor(Color.theme.primaryText)
                    }
                    .padding(12)
                    
                    Text("Security Escort")
                        .foregroundColor(Color.theme.primaryText)
                        .font(.custom("Poppins-Medium", size: 18))
                        .shadow(radius: 6)
                    
                    Spacer()
                }
            }
            
            Button {
                print("DEBUG: Handle Security Detail...")
            } label: {
                HStack {
                    ZStack {
                        Circle()
                            .fill(Color.theme.button)
                            .frame(width: 50, height: 50)
                            .shadow(radius: 6)
                        
                        Image(systemName: "shield.righthalf.filled")
                            .foregroundColor(Color.theme.primaryText)
                    }
                    .padding(12)
                    
                    Text("Security Detail")
                        .foregroundColor(Color.theme.primaryText)
                        .font(.custom("Poppins-Medium", size: 18))
                        .shadow(radius: 6)
                    
                    Spacer()
                }
            }

        }
        .frame(width: UIScreen.main.bounds.width, height: 250)
        .background(
            Rectangle()
                .fill(Color.theme.background)
//                .shadow(radius: 40, y: -8)
        )
        
    }
}

struct LocationSearchActivationView_Previews: PreviewProvider {
    static var previews: some View {
        LocationSearchActivationView()
    }
}
