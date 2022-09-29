//
//  SearchView.swift
//  Athena
//
//  Created by Tshimega Belmont on 2022/09/26.
//

import SwiftUI

struct SearchView: View {
    var body: some View {
        ZStack {
            Color.theme.background.edgesIgnoringSafeArea(.top)
            Text("Search View")
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
