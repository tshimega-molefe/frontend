//
//  SearchView.swift
//  Athena
//
//  Created by Tshimega Belmont on 2022/09/26.
//

import SwiftUI

struct SearchView: View {
    @State var searchQuery = ""

    
    let myCriminals = [ "Escobar", "El Chapo", "Jacob Zuma", "General Shepard", "Osama Bin Laden", "Majin Buu"]
    
    
    var body: some View {
        NavigationView {
            List {
                ForEach(myCriminals, id: \.self) { criminals in
                    Text(criminals)
                }
            }
            .listStyle(.sidebar)
            .searchable(text: $searchQuery)
            .navigationBarTitleDisplayMode(.large)
            .navigationTitle("Directory")
        }
        
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
