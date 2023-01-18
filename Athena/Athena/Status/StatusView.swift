//
//  StatusView.swift
//  Athena
//
//  Created by Tshimega Belmont on 2022/09/26.
//

import SwiftUI
import MapboxMaps

struct StatusView: View {
    var body: some View {
        ZStack(alignment: .topLeading) {
            StatusMap().edgesIgnoringSafeArea(.top)
            
            // PUH-LEASE FOR THE LOVE OF GOD ADD AN ENUM TO THESE BUTTONS
            VStack (alignment: .leading, spacing: 30) {
                
                Button {
                    print("DEBUG: Handle Danger Level Update")
                } label: {
                    
                    HStack {
                        Image(systemName: "exclamationmark.triangle")
                            .font(.title)
                            .foregroundColor(.white)
                    }
                    
                    Text("Green")
                        .foregroundColor(Color.theme.green)
                        .font(.custom(FontsManager.Poppins.regular, size: 16))
                    
                }
                
                Button {
                    print("DEBUG: Handle Nearby Security Units")
                } label: {
                    HStack {
                        Image(systemName: "waveform.path.ecg")
                            .font(.title)
                            .foregroundColor(.white)
                    }
                    
                    Text("2")
                        .foregroundColor(.white)
                        .font(.custom(FontsManager.Poppins.regular, size: 16))
                }
                
                Button {
                    print("DEBUG: Handle MyCircle")
                } label: {
                    
                    HStack {
                        Image(systemName: "figure.2.and.child.holdinghands")
                            .font(.title)
                            .foregroundColor(.white)
                        
                        Text("4")
                            .foregroundColor(.white)
                            .font(.custom(FontsManager.Poppins.regular, size: 16))
                    }
                    
                }
                Button {
                    print("DEBUG: Handle Watch Me")
                } label: {
                    HStack {
                        Image(systemName: "eye.trianglebadge.exclamationmark")
                            .font(.title)
                            .foregroundColor(.white)
                        Text("Watch Me")
                            .foregroundColor(.white)
                            .font(.custom(FontsManager.Poppins.regular, size: 16))
                    }
                }
            }
            .padding(.leading)
            .shadow(color: .white, radius: 7)
            
        }
    }
}

struct StatusView_Previews: PreviewProvider {
    static var previews: some View {
        StatusView()
    }
}

