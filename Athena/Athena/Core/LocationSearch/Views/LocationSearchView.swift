//
//  LocationSearchView.swift
//  Athena
//
//  Created by Tshimega Belmont on 2022/10/05.
//

import SwiftUI

struct LocationSearchView: View {
    @State private var startLocationText = ""
    @EnvironmentObject var viewModel: LocationSearchViewModel
    
    
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
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
                    .font(.custom(FontsManager.Poppins.medium, size: 15))
                    .foregroundColor(Color.theme.primaryText)
                    .background(Color.theme.pinkRing)
                    .padding(.trailing)
                    .accentColor(Color.theme.accent)
                }
                
            }
            .padding(.horizontal)
            .padding(.top)

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
                            viewModel.selectLocation(result)
                            presentationMode.wrappedValue.dismiss()
                        }
                    }
                }
            }
            
        }
        .navigationTitle("Security Escort")
        .navigationBarHidden(false)
        .navigationBarBackButtonHidden(false)
        .background(Color.theme.background)
    }
}

struct LocationSearchView_Previews: PreviewProvider {
    static var previews: some View {
        LocationSearchView()
    }
}
