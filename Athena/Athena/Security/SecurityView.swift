//
//  SecurityView.swift
//  Athena
//
//  Created by Tshimega Belmont on 2022/09/26.
//

import SwiftUI
import MapboxMaps

struct SecurityView: View {
    @ObservedObject var locationService: LocationSearchService
    var body: some View {
        VStack {
            StatusMap().edgesIgnoringSafeArea(.top)
            
            Text("How can we help?")
                .foregroundColor(Color.theme.accent)
                .font(.custom(FontsManager.Poppins.semiBold, size: 20))
            
            VStack(alignment: .leading, spacing: 35) {
                NavigationLink {
                    LocationSearchView(locationService: LocationSearchService())
                } label: {
                    HStack {
                        // Service Type Circle
                        ZStack {
                            Circle()
                                .fill(Color.theme.button)
                                .frame(width: 50, height: 50)
                                .shadow(color: Color.theme.shadow, radius: 6)
                            
                            Image(systemName: "car.circle")
                                .foregroundColor(Color.theme.primaryText)
                                .font(.title)
                        }
                        // Service Name
                        Text("Security Escort")
                            .foregroundColor(Color.theme.primaryText)
                            .font(.custom(FontsManager.Poppins.medium, size: 18))
                            .padding(.leading)
                        
                        Spacer()
                    }
                    .padding(.horizontal)
                }
                
                NavigationLink {
                    LocationSearchView(locationService: LocationSearchService())
                } label: {
                    HStack {
                        // Service Type Circle
                        ZStack {
                            Circle()
                                .fill(Color.theme.button)
                                .frame(width: 50, height: 50)
                                .shadow(color: Color.theme.shadow, radius: 6)
                            
                            Image(systemName: "box.truck.badge.clock")
                                .foregroundColor(Color.theme.primaryText)
                                
                        }
                        // Service Name
                        Text("Secure Delivery")
                            .foregroundColor(Color.theme.primaryText)
                            .font(.custom(FontsManager.Poppins.medium, size: 18))
                            .padding(.leading)
                        
                        Spacer()
                    }
                    .padding(.horizontal)
                }
            }.padding(.bottom, 30)
        }
        .navigationTitle(Text("Services"))
        .navigationBarHidden(true)
    }
}

struct SecurityView_Previews: PreviewProvider {
    static var previews: some View {
        SecurityView(locationService: LocationSearchService())
    }
}
