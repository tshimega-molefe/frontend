//
//  LocationSearchView.swift
//  Athena
//
//  Created by Tshimega Belmont on 2022/10/05.
//

import SwiftUI

struct LocationSearchView: View {
    @State private var startLocationText = ""
    @Binding var mapState: SecurityMapViewState
    @EnvironmentObject var viewModel: LocationSearchViewModel
    
    var body: some View {
        if #available(iOS 16.0, *) {
            VStack {
                // header view
                HStack {
                    VStack{
                        Circle()
                            .fill(Color.theme.grey)
                            .frame(width: 6, height: 6)
                        
                        Rectangle()
                            .fill(Color.theme.grey)
                            .frame(width: 1, height: 24)
                        
                        Rectangle()
                            .fill(Color.theme.red)
                            .frame(width: 6, height: 6)
                        
                        
                    }
                    
                    VStack {
                        TextField("Current Location", text:
                                    $startLocationText)
                        .frame(height: 32)
                        .font(.custom(FontsManager.Poppins.medium, size: 15))
                        .foregroundColor(Color.theme.primaryText)
                        .background(Color.theme.lightGrey)
                        .padding(.trailing)
                        .accentColor(Color.theme.accent)
                        
                        TextField("Where to?", text:
                                    $viewModel.queryFragment)
                        .frame(height: 32)
                        .privacySensitive()
                        .autocorrectionDisabled()
                        .textInputAutocapitalization(.never)
                        .font(.custom(FontsManager.Poppins.medium, size: 15))
                        .foregroundColor(Color.theme.primaryText)
                        .background(Color.theme.pinkRing)
                        .padding(.trailing)
                        .accentColor(Color.theme.accent)
                    }
                    
                }
                .padding(.horizontal)
                .padding(.top, 30)
                
                Divider()
                    .padding(.vertical)
                
                // Add two place holders for the users two favourite locations between the "Where to" bar, and the ScrollView
                
                // list view
                ScrollView {
                    VStack (alignment: .leading) {
                        ForEach(viewModel.results, id: \.self) { result in
                            LocationSearchResultsCell(title:
                                                        result.title, subtitle:
                                                        result.subtitle)
                            .onTapGesture {
                                withAnimation(.spring()) {
                                    viewModel.selectLocation(result)
                                    mapState = .locationSelected
                                }
                            }
                        }
                    }
                }
                
            }
            .toolbar(.visible, for: .tabBar)
            .navigationBarHidden(true)
            .navigationBarBackButtonHidden(true)
            .background(Color.theme.background)
        } else {
            // Fallback on earlier versions
        }
    }
}

struct LocationSearchView_Previews: PreviewProvider {
    static var previews: some View {
        LocationSearchView(mapState: .constant(.searchingForLocation))
    }
}
