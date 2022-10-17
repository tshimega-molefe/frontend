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
                
            NavigationLink {
                LocationSearchView()
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
                        
                    
                    Spacer()
                }
            }
            .padding(.leading, 10)
            
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
                        
                    
                    Spacer()
                }
            }
            .padding(.leading, 10)

        }
        .frame(width: UIScreen.main.bounds.width, height: 250)
        .background(
            Rectangle()
                .fill(Color.theme.background)
                
        )
        
    }
}

struct LocationSearchActivationView_Previews: PreviewProvider {
    static var previews: some View {
        LocationSearchActivationView()
    }
}
