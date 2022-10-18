//
//  ServiceRequestView.swift
//  Athena
//
//  Created by Tshimega Belmont on 2022/10/11.
//

import SwiftUI

struct ServiceRequestView: View {
    
    var body: some View {
        
        if #available(iOS 16.0, *) {
            VStack {
                Capsule()
                    .foregroundColor(Color(.systemGray6))
                    .frame(width: 40, height: 6)
                    .padding(.top, 8)
                
                Text("Swipe to select your preferred option")
                    .font(.custom(FontsManager.Poppins.regular, size: 10))
                    .foregroundColor(Color.theme.secondaryText)
                    .padding(.top)
                
                // Security Responder Information View
                
                ResponderView()
                
                // Payment Option View
                
                PaymentOptionView()
                
                // Request Service button
                
                AuthButtonView(buttonLabel: "Confirm ARES") {
                    print("DEBUG: Handle Confirm Ares...")
                }
                .padding(.top)
            }
            
            .navigationBarHidden(true)
            .toolbar(.hidden, for: .tabBar)
            .navigationBarBackButtonHidden(true)
            .padding(.bottom, 50)
            .background(Color.theme.background)
            .cornerRadius(24)
        } else {
            // Fallback on earlier versions
        }
    }
}

struct ServiceRequestView_Previews: PreviewProvider {
    static var previews: some View {
        ServiceRequestView()
    }
}

struct ResponderView: View {
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack (spacing: 12){
                ForEach(0 ..< 3, id: \.self) { _ in
                HStack (alignment: .top) {
                            // Security Profile Image
                        Image(uiImage: UIImage(imageLiteralResourceName: "security"))
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 132.66, height: 200)
                            .cornerRadius(15)
//                            .shadow(color: Color.theme.shadow, radius: 2)
                        
                        VStack (alignment: .leading, spacing: 8) {
                            // Security Name
                            Text("Soap Mactavish")
                                .font(.custom(FontsManager.Poppins.semiBold, size: 16))
                                .foregroundColor(Color.theme.primaryText)
                                .padding(.bottom, 8)
                            
                            // Security Unit
                            Text("Task Force 141")
                                .font(.custom(FontsManager.Poppins.light, size: 12))
                                .foregroundColor(Color.theme.grey)
                            
                            // Security Vehicle
                            Text("BMW M8 Competition - ")
                                .font(.custom(FontsManager.Poppins.light, size: 12))
                                .foregroundColor(Color.theme.grey)
                            
                            +
                            // Vehicle Color
                            Text("Black")
                                .font(.custom(FontsManager.Poppins.semiBold, size: 12))
                                .foregroundColor(Color.theme.primaryText)
                            
                            // Vehicle Registration
                            Text("GHOST141 GP")
                                .font(.custom(FontsManager.Poppins.light, size: 12))
                                .foregroundColor(Color.theme.grey)
                            
                            // Estimated Time Of Arrival
                            Text("ETA: ")
                                .font(.custom(FontsManager.Poppins.light, size: 12))
                                .foregroundColor(Color.theme.grey)
                            
                            +
                            
                            Text("3 MIN")
                                .font(.custom(FontsManager.Poppins.light, size: 12))
                                .foregroundColor(Color.theme.accent)
                            
                            
                            // Service Price
                            HStack {
                                
                                Text("R ")
                                    .font(.custom(FontsManager.Poppins.semiBold, size: 16))
                                    .foregroundColor(.primary)
                                +
                                
                                Text("159,00")
                                    .font(.custom(FontsManager.Poppins.semiBold, size: 16))
                                    .foregroundColor(.primary)
                            }
                            .padding(.top, 40)
                            
                            

                        }
                        .padding(.leading)
                    }
                    .padding(.top)
                }
            }
        }.padding(.horizontal, 30)
    }
}

struct PaymentOptionView: View {
    var body: some View {
        HStack (spacing: 12) {
            Image(systemName: "creditcard.fill")
                .font(.subheadline)
                .foregroundColor(.primary)
                .padding(.leading)
            
            
            Text("**** 5117")
                .font(.custom(FontsManager.Poppins.regular, size: 20))
                .foregroundColor(Color.theme.primaryText)
            
            Spacer()
            Image(systemName: "chevron.right")
                .imageScale(.medium)
                .foregroundColor(Color.theme.accent)
                .padding()
            
        }
        .frame(height: 50)
        .cornerRadius(10)
        .padding(.horizontal, 30)
        .padding(.top)
    }
}
