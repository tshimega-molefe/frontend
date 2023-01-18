//
//  LegalView.swift
//  Athena
//
//  Created by Tshimega Belmont on 2022/12/19.
//

import SwiftUI

struct LegalView: View {
    var body: some View {
        List {
            
            NavigationLink {
                Text("Copyright")
            } label: {
                Text("Copyright")
            }
            
            NavigationLink {
                Text("Terms & Conditions")
            } label: {
                Text("Terms & Conditions")
            }
            
            NavigationLink {
                Text("Privacy Policy")
            } label: {
                Text("Privacy Policy")
            }
            
            NavigationLink {
                Text("Data Providers")
            } label: {
                Text("Data Providers")
            }
            
            NavigationLink {
                Text("Software Licence")
            } label: {
                Text("Software Licence")
            }
            
            NavigationLink {
                Text("Location Information")
            } label: {
                Text("Location Information")
            }
            
        }
        .listStyle(.insetGrouped)
        .navigationBarTitleDisplayMode(.large)
        .navigationTitle("Legal")
    }
}

struct LegalView_Previews: PreviewProvider {
    static var previews: some View {
        LegalView()
    }
}
