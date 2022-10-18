//
//  DetailButtonView.swift
//  Athena
//
//  Created by Tshimega Belmont on 2022/10/17.
//

import SwiftUI

struct DetailButtonView: View {
    let clicked: (() -> Void)
    var body: some View {
        Button(action: clicked) {
            HStack {
                ZStack {
                    Circle()
                        .fill(Color.theme.button)
                        .frame(width: 50, height: 50)
                        .shadow(color: Color.theme.shadow, radius: 6)
                    
                    Image(systemName: "shield.righthalf.filled")
                        .foregroundColor(Color.theme.primaryText)
                }
                .padding(12)
                
                Text("VIP Security")
                
                
                // MARK: - BUG FIX - Thread 1: Breakpoint 1.1
                    .font(.custom(FontsManager.Poppins.medium, size: 18))
                    .foregroundColor(Color.theme.primaryText)
               
                    
                    
                
                Spacer()
            }
        }
        .padding(.leading, 8)
    }
}

struct DetailButtonView_Previews: PreviewProvider {
    static var previews: some View {
        DetailButtonView {
            print("DEBUG: Handle VIP Security action..")
        }
    }
}
