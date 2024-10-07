//
//  NewAccountView.swift
//  PocketPal
//
//  Created by Adrian Faz on 22/06/24.
//

import SwiftUI
import SwiftData

struct NewAccountView: View {
    @State var cardName: String = ""
    @State var balance: String = ""
    @State var accountType: AccountType = .debit
    @State var fechaCorte: String = ""
    @Environment(\.modelContext) var modelContext
    @Query var accounts: [Account]
    @Query var transactions: [Transaction]
    var body: some View {
        NavigationStack {
            VStack {
                Text("Add New Account")
                    .font(.title)
                    .fontWeight(.heavy)
                
                
                Image(systemName: "creditcard")
                    .font(.system(size: Global.screenWidth*0.35))
                    .fontWeight(.thin)
                    .frame(width: Global.screenWidth * 0.395, height: Global.screenHeight * 0.125)
                .background(RoundedRectangle(cornerRadius: 15).fill(.lightGreen).stroke(.gray, lineWidth: 0.5))
                
                        VStack(spacing: 20) {
                            HStack{
                                VStack(alignment: .leading, spacing: 5){
                                    Text("Card Name")
                                        .fontWeight(.semibold)
                                        .font(.title3)
                                    
                                    TextField("Card Name", text: $cardName)
                                        .frame(width: Global.screenWidth*0.5)
                                                                        
                                }
                                Spacer()
                            }
                            
                            
                            HStack{
                                VStack(alignment: .leading, spacing: 5){
                                    Text("Initial Balance")
                                        .fontWeight(.semibold)
                                        .font(.title3)
                                    
                                    
                                    TextField("Initial Balance", text: $balance)
                                        .frame(width: Global.screenWidth*0.5)
                                }
                                Spacer()
                            }
                            
                            HStack{
                                VStack(alignment: .leading, spacing: 5){
                                    Text("Type")
                                        .fontWeight(.semibold)
                                        .font(.title3)
                                    
                                    Picker("Account Type", selection: $accountType) {
                                        ForEach(AccountType.allCases, id: \.self) { type in
                                                        Text(type.rawValue.capitalized).tag(type)
                                                    }
                                                }
                                    
                                    //TextField("Color", text: $color)
                                        //.frame(width: Global.screenWidth*0.5)
                                }
                                Spacer()
                            }
                            
                            if accountType == .credit {
                                HStack{
                                    VStack(alignment: .leading, spacing: 5){
                                        Text("Fecha De Corte")
                                            .fontWeight(.semibold)
                                            .font(.title3)
                                        
                                        TextField("Fecha de corte", text: $fechaCorte)
                                            .frame(width: Global.screenWidth*0.5)
                                        
                                        //TextField("Color", text: $color)
                                            //.frame(width: Global.screenWidth*0.5)
                                    }
                                    Spacer()
                                }
                            }
                            

                            
                            Spacer()
                        }.padding(.vertical)
                            .frame(width: Global.screenWidth * 0.75, height: Global.screenHeight*0.5)
                    
                    
                                    
    
                
                
                Spacer()
                
                HStack(spacing: 50) {
                    
                    NavigationLink {
                        AccountsView()
                            .onAppear {
                                
                                withAnimation(.linear(duration: 5)) {
                                    
                                    if cardName != "" || balance != "" {
                                        let newAccount = Account(name: cardName, type: .debit, balance: Double(balance) ?? 0.00)
                                        
                                        modelContext.insert(newAccount)
                                        
                                        cardName = ""
                                        balance = ""
                                    }
                                }
                                                         
                                                        
                            }
                    } label: {
                        Text("Crear Cuenta")
                            .padding(10)
                            .foregroundStyle(.white)
                            .background(RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
                            )
                            .padding(.vertical
                            )
                    }
                    
                }
                                
                
            }
            
        }
    }
}

#Preview {
    NewAccountView(cardName: "")
}
