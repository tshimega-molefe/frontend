//
//  LocationSearchView.swift
//  Athena
//
//  Created by Tshimega Belmont on 2022/10/05.
//

import SwiftUI

struct LocationSearchView: View {
    @Environment(\.presentationMode) var presentationMode
    
    @State private var startLocationText = ""
    @ObservedObject var locationService: LocationSearchService
    
    var cancelButton: some View {
        CancelButton(imageName: "chevron.left", font: .title2) {
            presentationMode.wrappedValue.dismiss()
        }
        
    }
    
    var body: some View {
        if #available(iOS 16.0, *) {
            VStack(alignment: .leading) {
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
                                    $locationService.queryFragment)
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
                
                ScrollView {
                    VStack (alignment: .leading) {
                        ForEach(locationService.searchResults, id: \.self) { result in
                            
                            LocationSearchResultsCell(title: result.title, subtitle: result.subtitle)
                            .onTapGesture {
                                locationService.selectLocation(result)
                            }
                        }
                    }
                }
            }
            .navigationBarBackButtonHidden(true)
            .navigationBarItems(leading: cancelButton)
            .toolbar(.visible, for: .tabBar)
            .background(Color.theme.background)
        } else {
            // Fallback on earlier versions
        }
    }
}

struct LocationSearchView_Previews: PreviewProvider {
    static var previews: some View {
        LocationSearchView(locationService: LocationSearchService())
    }
}
