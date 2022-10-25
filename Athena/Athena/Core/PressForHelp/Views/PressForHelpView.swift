//
//  PressForHelpView.swift
//  Athena
//
//  Created by Tshimega Belmont on 2022/09/26.
//

import SwiftUI

struct PressForHelpView: View {
    var body: some View {
        ZStack {
            
            Color.theme.background.edgesIgnoringSafeArea(.top)
            
            HelpButton()
        
        }
    }
}

struct PressForHelpView_Previews: PreviewProvider {
    static var previews: some View {
        PressForHelpView()
    }
}

struct HelpText: View {
    var body: some View {
        
        
        HStack {
            Text("Press ")
                .font(.custom(FontsManager.Poppins.extraBold, size: 24))
                .foregroundColor(Color.theme.primaryText)
            
            +
            
            Text("for help")
                .font(.custom(FontsManager.Poppins.regular, size: 24))
                .foregroundColor(Color.theme.primaryText)
        }
        .frame(width: 248, height: 248)
        .background(Color.theme.button)
        .clipShape(Circle())
    }
}

struct RedRing: View {
    var body: some View {
        Circle()
            .stroke(Color.theme.red, lineWidth: 2)
            .frame(width: 250, height: 250)
            
    }
}

struct PinkRing: View {
    
    
    var body: some View {
        Circle()
            .stroke(Color.theme.pinkRing, lineWidth: 30)
            .frame(width: 270, height: 270)
    }
}




struct HelpButton: View {
    @State var tap = false
    @State var press = false
    
    @EnvironmentObject var wsViewModel: WebSocketViewModel
    
    var body: some View {
        ZStack{
            PinkRing()
                .shadow(color: Color.theme.red.opacity(0.40), radius: 50)
                .rotation3DEffect(Angle(degrees: 10), axis: (x: 10, y: 0, z: 0))
                .scaleEffect(tap ? 1.0125 : 1)
                
                
            RedRing()
                .scaleEffect(tap ? 1.0125 : 1)
                .rotation3DEffect(Angle(degrees: 10), axis: (x: 10, y: 0, z: 0))
            HelpText()
                .scaleEffect(tap ? 1.0125 : 1)
                .rotation3DEffect(Angle(degrees: 10), axis: (x: 10, y: 0, z: 0))
                
                .gesture(
                    LongPressGesture().onChanged { value in
                        self.tap = true
                        
                        print("DEBUG: Handle press for help..")
                        
                        //DEBUG: The connect needs to be called before the press for help button is pressed imo but this is working for now
                        wsViewModel.subscribeToService { (success) in
                            
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                                self.tap = false
                            }
                        }
                    }
                        .onEnded { value in
                            self.press.toggle()
                        }
            )
                        
            
        }
    }
}
