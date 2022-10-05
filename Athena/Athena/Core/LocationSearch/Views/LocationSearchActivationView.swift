//
//  LocationSearchActivationView.swift
//  Athena
//
//  Created by Tshimega Belmont on 2022/10/05.
//

import SwiftUI

struct LocationSearchActivationView: View {
    let buttonImageName: String
    let serviceLabel: String
    let clicked: (() -> Void)
    
    var body: some View {
        
            
        VStack (alignment: .center) {
                Text("What do you need?")
                    .foregroundColor(Color.theme.accent)
                    .font(.custom("Poppins-SemiBold", size: 20))
                    .padding(.bottom, 10)
                
            ServiceButton(buttonImageName: "house", serviceLabel: "Security Escort") {
                print("DEBUG: Handle Security Escort action...")
            }
            
            ServiceButton(buttonImageName: "shield.righthalf.filled", serviceLabel: "Security Detail") {
                print("DEBUG: Handle Security Detail action...")
            }
        }
        
    }
}

struct LocationSearchActivationView_Previews: PreviewProvider {
    static var previews: some View {
        LocationSearchActivationView(buttonImageName: "house", serviceLabel: "Security Escort") {
            print("DEBUG: Handle Button Action..")
        }
    }
}


struct ServiceButton: View {
    let buttonImageName: String
    let serviceLabel: String
    let clicked: (() -> Void)
    
    var body: some View {
        Button(action: clicked) {
            
            HStack {
                ZStack {
                    Circle()
                        .fill(Color.theme.button)
                        .frame(width: 50, height: 50)
                        .shadow(radius: 6)
                    
                    Image(systemName: buttonImageName)
                        .foregroundColor(Color.theme.primaryText)
                }
                .padding(12)
                
                Text(serviceLabel)
                    .foregroundColor(Color.theme.primaryText)
                    .font(.custom("Poppins-Medium", size: 18))
                    .shadow(radius: 6)
                
                Spacer()
            }
            
        }
    }
}
