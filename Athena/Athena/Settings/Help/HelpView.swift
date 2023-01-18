//
//  HelpView.swift
//  Athena
//
//  Created by Tshimega Belmont on 2022/12/19.
//

import SwiftUI

struct HelpView: View {
    var body: some View {
        NavigationView {
            List {
                Section {
                    VStack (spacing: 20) {
                        HStack {
                            Text("2019/08/24, 21:08")
                                .font(.custom(FontsManager.Poppins.light, size: 12))
                                .foregroundColor(Color.theme.primaryText)
                            Spacer()
                            VStack {
                                Text("R230,05")
                                    .font(.custom(FontsManager.Poppins.light, size: 12))
                                    .foregroundColor(Color.theme.primaryText)
                                Text("Completed")
                                    .font(.custom(FontsManager.Poppins.light, size: 10))
                                    .foregroundColor(Color.theme.secondaryText)
                            }
                        }
                        
                        StatusMap().frame(height: 150)
                        
                        NavigationLink {
                            Text("Report an issue")
                        } label: {
                            Text("Report an issue with this request")
                                .font(.custom(FontsManager.Poppins.light, size: 12))
                                .foregroundColor(Color.theme.primaryText)
                        }
                        
                        
                    }
                } header: {
                    Text("Your last request")
                        .font(.custom(FontsManager.Poppins.medium, size: 12))
                        .foregroundColor(Color.theme.primaryText)
                        .textCase(.none)
                }
                
                Section {
                    NavigationLink {
                        Text("Help with a request")
                    } label: {
                        HStack {
                            Image(systemName: "list.bullet")
                            Text("Help with a request")
                                .font(.custom(FontsManager.Poppins.light, size: 12))
                                .foregroundColor(Color.theme.primaryText)
                        }
                    }
                    
                    NavigationLink {
                        Text("Account and Payment Options")
                    } label: {
                        HStack {
                            Image(systemName: "list.bullet")
                            Text("Account and Payment Options")
                                .font(.custom(FontsManager.Poppins.light, size: 12))
                                .foregroundColor(Color.theme.primaryText)
                        }
                    }
                    
                    NavigationLink {
                        Text("More")
                    } label: {
                        HStack {
                            Image(systemName: "list.bullet")
                            Text("More")
                                .font(.custom(FontsManager.Poppins.light, size: 12))
                                .foregroundColor(Color.theme.primaryText)
                        }
                    }
                    
                    
                    NavigationLink {
                        Text("A Guide to Athena")
                    } label: {
                        HStack {
                            Image(systemName: "list.bullet")
                            Text("A Guide to Athena")
                                .font(.custom(FontsManager.Poppins.light, size: 12))
                                .foregroundColor(Color.theme.primaryText)
                        }
                    }
                    
                    NavigationLink {
                        Text("Signing up")
                    } label: {
                        HStack {
                            Image(systemName: "list.bullet")
                            Text("Signing up")
                                .font(.custom(FontsManager.Poppins.light, size: 12))
                                .foregroundColor(Color.theme.primaryText)
                        }
                    }
                    
                    NavigationLink {
                        Text("Accessibility")
                    } label: {
                        HStack {
                            Image(systemName: "list.bullet")
                            Text("Accessibility")
                                .font(.custom(FontsManager.Poppins.light, size: 12))
                                .foregroundColor(Color.theme.primaryText)
                        }
                    }
                    
                    NavigationLink {
                        Text("Athena Money")
                    } label: {
                        HStack {
                            Image(systemName: "list.bullet")
                            Text("Athena Money")
                                .font(.custom(FontsManager.Poppins.light, size: 12))
                                .foregroundColor(Color.theme.primaryText)
                        }
                    }
                    
                    NavigationLink {
                        Text("Subscription Information")
                    } label: {
                        HStack {
                            Image(systemName: "list.bullet")
                            Text("Subscription Information")
                                .font(.custom(FontsManager.Poppins.light, size: 12))
                                .foregroundColor(Color.theme.primaryText)
                        }
                    }
                    
                    
                    
                } header: {
                    Text("All Topics")
                        .font(.custom(FontsManager.Poppins.medium, size: 12))
                        .foregroundColor(Color.theme.primaryText)
                        .textCase(.none)
                    
                }
                
                Section {
                    NavigationLink {
                        Text("Call Support")
                    } label: {
                        HStack {
                            Image(systemName: "phone.and.waveform")
                            Text("Call Support")
                                .font(.custom(FontsManager.Poppins.medium, size: 12))
                                .foregroundColor(Color.theme.primaryText)
                        }
                    }
                    
                    
                } header: {
                    Text("Need help now?")
                        .font(.custom(FontsManager.Poppins.medium, size: 12))
                        .foregroundColor(Color.theme.primaryText)
                        .textCase(.none)
                    
                }
                
                Section {
                    NavigationLink {
                        MessagesView()
                    } label: {
                        Text("View all messages")
                            .font(.custom(FontsManager.Poppins.light, size: 12))
                            .foregroundColor(Color.theme.secondaryText)
                    }
                    
                    
                    
                } header: {
                    Text("Support Messages")
                        .font(.custom(FontsManager.Poppins.medium, size: 12))
                        .foregroundColor(Color.theme.primaryText)
                        .textCase(.none)
                    
                    
                    
                    
                    
                }
            }
            .navigationBarTitleDisplayMode(.inline)
            .navigationTitle("Help")
            .listStyle(.automatic)
        }
    }
    
    struct HelpView_Previews: PreviewProvider {
        static var previews: some View {
            HelpView()
        }
    }
}
