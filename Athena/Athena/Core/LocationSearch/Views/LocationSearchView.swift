//
//  LocationSearchView.swift
//  Athena
//
//  Created by Tshimega Belmont on 2022/10/05.
//

import SwiftUI

struct LocationSearchView: View {
    @State private var startLocationText = ""
    @State private var destinationLocationText = ""
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
                    .foregroundColor(Color.theme.grey)
                    .background(Color.theme.lightGrey)
                    .padding(.trailing)
                    .accentColor(Color.theme.accent)
                    
                    TextField("Where to?", text:
                    $destinationLocationText)
                    .frame(height: 32)
                    .font(.custom(FontsManager.Poppins.medium, size: 15))
                    .foregroundColor(Color.theme.primaryText)
                    .background(Color.theme.pinkRing)
                    .padding(.trailing)
                    .accentColor(Color.theme.accent)
                }
                
            }
            .padding(.horizontal)
            .padding(.top, 64)

            Divider()
                .padding(.vertical)
            
            // list view
            ScrollView {
                VStack (alignment: .leading) {
                    ForEach(0 ..< 20, id: \.self) { _ in
                        
                        LocationSearchResultsCell()
                        
                    }
                }
            }
            
        }
    }
}

struct LocationSearchView_Previews: PreviewProvider {
    static var previews: some View {
        LocationSearchView()
    }
}
