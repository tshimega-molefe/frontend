//
//  PressForHelpView.swift
//  Athena
//
//  Created by Tshimega Belmont on 2022/09/26.
//

import SwiftUI

struct PressForHelpView: View {
    
    @State private var mapState = HelpMapViewState.notPressed
    
    var body: some View {
        
        ZStack (alignment: .top) {
            
            ZStack (alignment: .bottom) {
                
                ZStack (alignment: .bottom) {
                    
                    if mapState == .pressed {
                        ZStack (alignment: .bottom) {
                            HelpMapViewRepresentable(helpMapState: $mapState).edgesIgnoringSafeArea(.top)
                        }
                    } else if mapState == .notPressed {
                        ZStack(alignment: .center) {
                            PressForHelpButton {
                                mapState = .pressed
                            }
                        }
                    }
                }
            
                if mapState == .pressed {
                    ZStack(alignment: .bottom) {
                        ServiceRequestView()
                            .transition(.move(edge: .bottom))
                    }
                }
            }.edgesIgnoringSafeArea(.bottom)
            
            if mapState == .pressed {
                
                if #available(iOS 16.0, *) {
                        CancelButton {
                            mapState = .notPressed
                        }
                        .toolbar(.hidden, for: .automatic)
                        .padding(.leading)
                    
                } else {
                    // Fallback on earlier versions
                }
                
            }
        }
    }
}

struct PressForHelpView_Previews: PreviewProvider {
    static var previews: some View {
        PressForHelpView()
    }
}


