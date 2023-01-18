//
//  FamilyView.swift
//  Athena
//
//  Created by Tshimega Belmont on 2022/12/19.
//

import SwiftUI

struct FamilyView: View {
    var body: some View {
        List {
            Section(header:

                HStack (alignment: .center) {
                    Image(systemName: "figure.2.and.child.holdinghands")
                        .foregroundColor(Color.theme.primaryText)
                    Text("Manage Family and Friends")
                    .font(.custom(FontsManager.Poppins.medium, size: 18))
                    .foregroundColor(Color.theme.secondaryText)
                    .textCase(.none)
            }
) {
                VStack (alignment: .leading) {
                    Text("Organiser")
                        .font(.custom(FontsManager.Poppins.regular, size: 12))
                        .foregroundColor(Color.theme.grey)
                    Text("Sabrina Morreno")
                        .font(.custom(FontsManager.Poppins.regular, size: 12))
                        .foregroundColor(Color.theme.secondaryText)
                    
                    Divider()
                    
                    NavigationLink {
                        Text("Add member page")
                    } label: {
                        Text("Add Members")
                            .font(.custom(FontsManager.Poppins.regular, size: 12))
                            .foregroundColor(.blue)
                    }

                }
            }
            
            Section(header: Text("Members will be invited to your Family Profile and share its default payment method.")
                .font(.custom(FontsManager.Poppins.regular, size: 12))
                .foregroundColor(Color.theme.secondaryText)
                .textCase(.none)) {
            }
            Section(header: Text("Preferences")
                .font(.custom(FontsManager.Poppins.regular, size: 12))
                .foregroundColor(Color.theme.secondaryText)
                .textCase(.none)) {
                
                NavigationLink {
                    Text("Card Management")
                } label: {
                    VStack (alignment: .leading) {
                        Text("Default Payment")
                            .font(.custom(FontsManager.Poppins.regular, size: 12))
                            .foregroundColor(Color.theme.grey)
                        Text("Visa 5117")
                            .font(.custom(FontsManager.Poppins.regular, size: 12))
                            .foregroundColor(Color.theme.secondaryText)
                    }
                }
                
                NavigationLink {
                    Text("Account Management Page")
                } label: {
                    VStack (alignment: .leading) {
                        Text("Email Preferences")
                            .font(.custom(FontsManager.Poppins.regular, size: 12))
                            .foregroundColor(Color.theme.grey)
                        Text("sabrina*****@gmail.com")
                            .font(.custom(FontsManager.Poppins.regular, size: 12))
                            .foregroundColor(Color.theme.secondaryText)
                    }
                }

            }
            
            Section(header: Text("When you make a request using this profile, these preferences will be selected by default")
                .font(.custom(FontsManager.Poppins.regular, size: 12))
                .foregroundColor(Color.theme.secondaryText)
                .textCase(.none)) {
               
                Button {
                    print("DEBUG: Handle Delete Profile")
                } label: {
                    Text("Delete Profile")
                        .font(.custom(FontsManager.Poppins.regular, size: 12))
                        .foregroundColor(Color.theme.red)
                }
                
            }
            
            

            
        }
        .listStyle(.automatic)
        .navigationBarTitleDisplayMode(.large)
        .navigationTitle("Family")
    }
}

struct FamilyView_Previews: PreviewProvider {
    static var previews: some View {
        FamilyView()
    }
}
