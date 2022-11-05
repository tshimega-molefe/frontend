//
//  SecurityBackgroundView.swift
//  Athena
//
//  Created by Tshimega Belmont on 2022/10/17.
//

import SwiftUI

struct SecurityServiceCard: View {
    enum SelectedService {
        case noInput
        case escort
        case vip
    }
    
    @Binding var selectedService: SelectedService?
    
    var body: some View {
        VStack {
            Text("How can we help?")
                .foregroundColor(Color.theme.accent)
                .font(.custom(FontsManager.Poppins.semiBold, size: 20))
                .padding(.top, 22)
            
            SecurityCardRow(text: "Security Escort", imageName: "house") {
                self.selectedService = .escort
            }
            SecurityCardRow(text: "VIP Security", imageName: "shield.righthalf.filled") {
                self.selectedService = .vip
            }
        }
        .background(Color.theme.background)
    }
     
}

struct SecurityServiceCard_Previews: PreviewProvider {
    static var previews: some View {
        SecurityServiceCard(selectedService: .constant(.noInput))
    }
}
