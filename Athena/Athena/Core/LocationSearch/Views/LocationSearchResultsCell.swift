//
//  LocationSearchResultsCell.swift
//  Athena
//
//  Created by Tshimega Belmont on 2022/10/05.
//

import SwiftUI

struct LocationSearchResultsCell: View {
    var body: some View {
        HStack {
            Image(systemName: "mappin.and.ellipse")
                .resizable()
                .foregroundColor(Color.theme.accent)
                .accentColor(Color.theme.background)
                .frame(width: 28, height: 28)
            
            VStack (alignment: .leading, spacing: 4) {
                Text("Starbucks Coffee")
                    .font(.custom("Poppins-Regular", size: 16))
                    .foregroundColor(Color.theme.primaryText)
                Text("123 Main St, Cupertino CA ")
                    .font(.custom("Poppins-Light", size: 15))
                    .foregroundColor(.gray)
                
                Divider()
            }
            .padding(.leading, 6)
            .padding(.vertical, 8)
        }
        .padding(.leading)
    }
}

struct LocationSearchResultsCell_Previews: PreviewProvider {
    static var previews: some View {
        LocationSearchResultsCell()
    }
}
