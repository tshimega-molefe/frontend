//
//  EvidenceView.swift
//  Athena
//
//  Created by Tshimega Belmont on 2022/12/19.
//

import SwiftUI

struct EvidenceView: View {
    var body: some View {
        List {
            NavigationLink {
                Text("Upload Files")
            } label: {
                HStack {
                    Image(systemName: "square.and.arrow.up")
                    Text("Upload Files")
                }
            }
            
            NavigationLink {
                Text("Download Files")
            } label: {
                HStack {
                    Image(systemName: "square.and.arrow.down")
                    Text("Download Files")
                }
            }
            
            NavigationLink {
                Text("Open a case")
            } label: {
                HStack {
                    Image(systemName: "square.and.pencil")
                    Text("Open a case")
                }
            }
            
            NavigationLink {
                Text("Status Report")
            } label: {
                HStack {
                    Image(systemName: "doc")
                    Text("Status Report")
                }
            }
        }
        .listStyle(.insetGrouped)
        .navigationTitle("Evidence")
        .navigationBarTitleDisplayMode(.large)
    }
}

struct EvidenceView_Previews: PreviewProvider {
    static var previews: some View {
        EvidenceView()
    }
}
