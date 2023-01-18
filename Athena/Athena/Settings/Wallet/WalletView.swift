//
//  WalletView.swift
//  Athena
//
//  Created by Tshimega Belmont on 2022/12/19.
//

import SwiftUI

struct WalletView: View {
    var body: some View {
        NavigationView {
            VStack (alignment: .leading, spacing: 40) {
                ZStack (alignment: .center) {
                    
                    RoundedRectangle(cornerRadius: 20)
                        .fill(.background)
                        .frame(height: 240)
                        .padding(.horizontal)
                        .shadow(color: Color.theme.shadow ,radius: 15, x: 3, y:5)
                    
                    VStack(alignment: .leading, spacing: 18) {
                        Text("Athena Cash")
                            .font(.custom(FontsManager.Poppins.regular, size: 16))
                            .foregroundColor(Color.theme.primaryText)
                        
                        HStack() {
                            Text("R0,00")
                                .font(.custom(FontsManager.Poppins.regular, size: 40))
                                .foregroundColor(Color.theme.primaryText)
                                .tracking(5)
                            Spacer()
                            
                            NavigationLink {
                                Text("Athena Cash")
                            } label: {
                                Image(systemName: "chevron.right")
                                    .font(.largeTitle)
                                    .foregroundColor(.primary)
                            }
                        }
                        
                        HStack() {
                            Image(systemName: "exclamationmark.circle")
                            Text("Auto-refill is off")
                                .font(.custom(FontsManager.Poppins.regular, size: 16))
                                .foregroundColor(Color.theme.secondaryText)
                        }
                        
                        NavigationLink {
                            Text("Athena Cash")
                        } label: {
                            ZStack (alignment: .leading) {
                                RoundedRectangle(cornerRadius: 20)
                                    .frame(width: 165, height: 40)
                                    .foregroundColor(Color.theme.secondaryText)
                                HStack {
                                    Image(systemName: "plus")
                                        .foregroundColor(Color.theme.background)
                                    Text("Add Funds")
                                        .font(.custom(FontsManager.Poppins.regular, size: 20))
                                        .foregroundColor(Color.theme.background)
                                }.padding(.horizontal)
                            }
                        }
                    }
                    .padding(.horizontal, 30)
                }
                List {
                    Section {
                        
                        NavigationLink {
                            Text("Card Management")
                        } label: {
                            HStack {
                                Image(systemName: "creditcard.fill")
                                Text("**** 5117")
                                    .font(.custom(FontsManager.Poppins.regular, size: 18))
                                    .foregroundColor(Color.theme.primaryText)
                            }
                        }
                        
                        NavigationLink {
                            Text("Card Management")
                        } label: {
                            HStack {
                                Image(systemName: "creditcard.fill")
                                Text("**** 6010")
                                    .font(.custom(FontsManager.Poppins.regular, size: 18))
                                    .foregroundColor(Color.theme.primaryText)
                            }
                        }
                        
                        NavigationLink {
                            Text("Add Payment Method")
                        } label: {
                            HStack {
                                Image(systemName: "plus")
                                Text("Add payment method or redeem gift card")
                                    .font(.custom(FontsManager.Poppins.regular, size: 14))
                                    .foregroundColor(Color.theme.secondaryText)
                            }
                        }
                        

                    } header: {
                        Text("Payment Methods")
                            .font(.custom(FontsManager.Poppins.regular, size: 20))
                            .foregroundColor(Color.theme.secondaryText)
                    }
                    
                    Section {
                        
                        NavigationLink {
                            Text("Vouchers")
                        } label: {
                            HStack {
                                Image(systemName: "tag")
                                Text("Vouchers")
                                    .font(.custom(FontsManager.Poppins.regular, size: 14))
                                    .foregroundColor(Color.theme.secondaryText)
                            }
                        }
                        
                        NavigationLink {
                            Text("Add Voucher Code")
                        } label: {
                            HStack {
                                Image(systemName: "plus")
                                Text("Add voucher code")
                                    .font(.custom(FontsManager.Poppins.regular, size: 14))
                                    .foregroundColor(Color.theme.secondaryText)
                            }
                        }

                        
                    } header: {
                        Text("Vouchers")
                            .font(.custom(FontsManager.Poppins.regular, size: 20))
                            .foregroundColor(Color.theme.secondaryText)
                    }
                    
                    Section {
                        NavigationLink {
                            Text("Promotions")
                        } label: {
                            HStack {
                                Image(systemName: "plus")
                                Text("Add promo code")
                                    .font(.custom(FontsManager.Poppins.regular, size: 14))
                                    .foregroundColor(Color.theme.secondaryText)
                            }

                        }

                    } header: {
                        Text("Promotions")
                            .font(.custom(FontsManager.Poppins.regular, size: 20))
                            .foregroundColor(Color.theme.secondaryText)
                    }


                    
                }
                .listStyle(.plain)
            }
            .navigationTitle("Wallet")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct WalletView_Previews: PreviewProvider {
    static var previews: some View {
        WalletView()
    }
}
