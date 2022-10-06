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
            Image(systemName: "mappin.circle.fill")
                .resizable()
                .foregroundColor(Color.theme.accent)
                .accentColor(Color.theme.background)
                .frame(width: 28, height: 28)
            
            VStack (alignment: .leading, spacing: 4) {
                Text(title)
                    .font(.custom("Poppins-Regular", size: 16))
                    .foregroundColor(Color.theme.primaryText)
                
                Text(subtitle)
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
        LocationSearchResultsCell(title: "Starbucks", subtitle: "123 M St")
    }
}
