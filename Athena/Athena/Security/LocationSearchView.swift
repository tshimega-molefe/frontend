//
//  LocationSearchView.swift
//  Athena
//
//  Created by Tshimega Belmont on 2022/10/05.
//

import SwiftUI

struct LocationSearchView: View {
    @ObservedObject var locationService: LocationSearchService
    
    var body: some View {
        VStack(alignment: .leading) {
            SearchBar(text: $locationService.queryFragment)
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
        .navigationTitle("Enter Destination")
    }
}

struct LocationSearchView_Previews: PreviewProvider {
    static var previews: some View {
        LocationSearchView(locationService: LocationSearchService())
    }
}
