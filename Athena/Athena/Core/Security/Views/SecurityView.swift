//
//  SecurityView.swift
//  Athena
//
//  Created by Tshimega Belmont on 2022/09/26.
//

import SwiftUI

struct SecurityView: View {
    @State private var mapState = SecurityMapViewState.noInput
    @EnvironmentObject var viewModel: LocationSearchViewModel
    
    var body: some View {
        ZStack(alignment: .top) {
            ZStack(alignment: .bottom) {
                ZStack (alignment: .bottom) {
                    SecurityMapViewRepresentable(mapState: $mapState).edgesIgnoringSafeArea(.top)
                    
                    // "How can we help" Overlay Structure
                    
                    if mapState == .searchingForLocation {
                        ZStack (alignment: .top){
                            LocationSearchView(mapState: $mapState)
                            
                            ChevronCancelButton {
                                mapState = .noInput
                            }
                            .padding(.leading)
                        }
                        
                    } else if mapState == .noInput {
                        ZStack (alignment: .bottom) {
                            SecurityBackgroundView()
                            
                            VStack (alignment: .center, spacing: 10) {
                                EscortButtonView {
                                    mapState = .searchingForLocation
                                    viewModel.selectedLocationCoordinate = nil
                                }
                                
                                DetailButtonView {
                                    print("DEBUG: Handle VIP security action..")
                                }
                            }
                            .padding(.bottom, 110)
                            
                            
                        }
                    }
                }
                
                if mapState == .locationSelected {
                    ServiceRequestView()
                        .transition(.move(edge: .bottom))
                }
            }.edgesIgnoringSafeArea(.bottom)
            
            if mapState == .locationSelected {
                
                if #available(iOS 16.0, *) {
                        CancelButton {
                            mapState = .noInput
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

struct SecurityView_Previews: PreviewProvider {
    static var previews: some View {
        SecurityView()
    }
}
