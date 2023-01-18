//
//  LocationSearchResultsCell.swift
//  Athena
//
//  Created by Tshimega Belmont on 2022/10/05.
//

import SwiftUI

struct LocationSearchResultsCell: View {
    let title: String
    let subtitle: String
    
    var body: some View {
        HStack {
            Image(systemName: "location.circle")
                .resizable()
                .foregroundColor(Color.theme.accent)
                .accentColor(Color.theme.background)
                .frame(width: 24, height: 24)
            
            VStack (alignment: .leading, spacing: 1) {
                Text(title)
                    .font(.custom("Poppins-Regular", size: 16))
                    .foregroundColor(Color.theme.primaryText)
                
                Text(subtitle)
                    .font(.custom("Poppins-Light", size: 14))
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
        LocationSearchResultsCell(title: "Starbucks", subtitle: "123 M St")
    }
}
