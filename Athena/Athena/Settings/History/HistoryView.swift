//
//  HistoryView.swift
//  Athena
//
//  Created by Tshimega Belmont on 2022/12/19.
//

import SwiftUI

struct HistoryView: View {
    var body: some View {
        NavigationView {
            List {
                VStack (spacing: 20) {
                    NavigationLink {
                        Text("Trip Details")
                    } label: {
                        HStack {
                            Text("2022/08/24, 21:08")
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
                    }

                    
                    
                    StatusMap().frame(height: 150)
                }
                VStack (spacing: 20) {
                    NavigationLink {
                        Text("Trip Details")
                    } label: {
                        HStack {
                            Text("2022/03/29, 18:02")
                                .font(.custom(FontsManager.Poppins.light, size: 12))
                                .foregroundColor(Color.theme.primaryText)
                            Spacer()
                            VStack {
                                Text("R0,00")
                                    .font(.custom(FontsManager.Poppins.light, size: 12))
                                    .foregroundColor(Color.theme.primaryText)
                                Text("Cancelled")
                                    .font(.custom(FontsManager.Poppins.light, size: 10))
                                    .foregroundColor(Color.theme.secondaryText)
                            }
                        }
                    }

                    
                    
                    StatusMap().frame(height: 150)
                }
                VStack (spacing: 20) {
                    NavigationLink {
                        Text("Trip Details")
                    } label: {
                        HStack {
                            Text("2022/02/20, 23:05")
                                .font(.custom(FontsManager.Poppins.light, size: 12))
                                .foregroundColor(Color.theme.primaryText)
                            Spacer()
                            VStack {
                                Text("R0,00")
                                    .font(.custom(FontsManager.Poppins.light, size: 12))
                                    .foregroundColor(Color.theme.primaryText)
                                Text("Cancelled")
                                    .font(.custom(FontsManager.Poppins.light, size: 10))
                                    .foregroundColor(Color.theme.secondaryText)
                            }
                        }
                    }

                    
                    
                    StatusMap().frame(height: 150)
                }
                VStack (spacing: 20) {
                    NavigationLink {
                        Text("Trip Details")
                    } label: {
                        HStack {
                            Text("2022/01/02, 01:56")
                                .font(.custom(FontsManager.Poppins.light, size: 12))
                                .foregroundColor(Color.theme.primaryText)
                            Spacer()
                            VStack {
                                Text("R310,65")
                                    .font(.custom(FontsManager.Poppins.light, size: 12))
                                    .foregroundColor(Color.theme.primaryText)
                                Text("Completed")
                                    .font(.custom(FontsManager.Poppins.light, size: 10))
                                    .foregroundColor(Color.theme.secondaryText)
                            }
                        }
                    }

                    
                    
                    StatusMap().frame(height: 150)
                }
                VStack (spacing: 20) {
                    NavigationLink {
                        Text("Trip Details")
                    } label: {
                        HStack {
                            Text("2021/11/04, 03:05")
                                .font(.custom(FontsManager.Poppins.light, size: 12))
                                .foregroundColor(Color.theme.primaryText)
                            Spacer()
                            VStack {
                                Text("R89,23")
                                    .font(.custom(FontsManager.Poppins.light, size: 12))
                                    .foregroundColor(Color.theme.primaryText)
                                Text("Completed")
                                    .font(.custom(FontsManager.Poppins.light, size: 10))
                                    .foregroundColor(Color.theme.secondaryText)
                            }
                        }
                    }

                    
                    
                    StatusMap().frame(height: 150)
                }
                VStack (spacing: 20) {
                    NavigationLink {
                        Text("Trip Details")
                    } label: {
                        HStack {
                            Text("2020/10/12, 12:29")
                                .font(.custom(FontsManager.Poppins.light, size: 12))
                                .foregroundColor(Color.theme.primaryText)
                            Spacer()
                            VStack {
                                Text("R0,00")
                                    .font(.custom(FontsManager.Poppins.light, size: 12))
                                    .foregroundColor(Color.theme.primaryText)
                                Text("Cancelled")
                                    .font(.custom(FontsManager.Poppins.light, size: 10))
                                    .foregroundColor(Color.theme.secondaryText)
                            }
                        }
                    }

                    
                    
                    StatusMap().frame(height: 150)
                }
            }
            .listStyle(.plain)
            .navigationTitle("History")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct HistoryView_Previews: PreviewProvider {
    static var previews: some View {
        HistoryView()
    }
}
