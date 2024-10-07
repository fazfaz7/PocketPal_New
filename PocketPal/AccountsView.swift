//
//  AccountsView.swift
//  PocketPal
//
//  Created by Adrian Faz on 21/06/24.
//

import SwiftUI
import SwiftData

struct AccountsView: View {
    @Environment(\.modelContext) var modelContext
    @Query var accounts: [Account]
    @Query var transactions: [Transaction]
    
    var body: some View {
        NavigationStack{
            VStack(alignment: .center) {
                
                VStack(alignment: .leading) {
                    Text("My Accounts")
                        .font(.title)
                        .fontWeight(.heavy)
                }
                ScrollView{
                    VStack(spacing: 15){
                        
                        SingleAccountView(accountName: "Cash", balance: 252.00, isCard: false)
                        
                        ForEach(accounts) { account in
                            NavigationLink {
                                AccountView(name: account.name, balance: account.balance, accountId: account.id)
                            } label: {
                                SingleAccountView(accountName: account.name, balance: account.balance, isCard: true)
                            }
                            
                        }


                        
                        NavigationLink {
                            NewAccountView()
                        } label: {
                            HStack {
                                Image(systemName: "plus.circle.fill")
                                    .foregroundStyle(.lightGreen)
                                    .font(.largeTitle)
                            }.padding(5)
                                .frame(width: Global.screenWidth * 0.85, height: Global.screenHeight * 0.09)
                                .background(RoundedRectangle(cornerRadius: 12).fill(.gray).shadow(radius:20).opacity(0.3))
                        }
                    }
                    
                    
                    
                    
                }
                .frame(height:Global.screenHeight*0.6)
                    
                Button {
                    addSamples()
                } label: {
                    Text("Add Samples")
                }
                Button {
                    deleteInfo()
                } label: {
                    Text("Delete Accounts")
                }
                List(accounts) { account in
                    
                    Text(account.name)
                        .swipeActions {
                            Button("Delete", systemImage: "trash", role: .destructive) {
                                modelContext.delete(account)
                            }
                        }
                    
                }
                
                Spacer()
            }.padding()
        }.navigationBarBackButtonHidden()
        

    }
    
    func addSamples() {
        let account1 = Account(name: "Cuenta Loca", type: .credit,  balance: 300.0)
        let account2 = Account(name: "Cuenta Prima", type: .debit, balance: 400.0)
        
        
        let trans1 = Transaction(concept: "Cumpleaños")
        let trans2 = Transaction(concept: "gastoloco")
        modelContext.insert(account1)
        modelContext.insert(account2)
        modelContext.insert(trans1)
        modelContext.insert(trans2)
    }
    
    func deleteInfo() {
        do {
            try modelContext.delete(model: Account.self)
            try modelContext.delete(model: Transaction.self)
        } catch {
            print("Failed to delete all schools.")
        }
    }
}

#Preview {
    AccountsView()
}

struct SingleAccountView: View {
    var accountName: String
    var balance: Double
    var isCard: Bool
    var body: some View {
        HStack(spacing: 15) {
            HStack{
                Image(systemName: isCard ? "creditcard.fill" : "banknote.fill")
                    .font(.title2)
                    .foregroundStyle(isCard ? .blue : .green)
                    .brightness(-0.3)
                
                Text(accountName)
                    .font(.title3)
            }.padding(.leading)
            Spacer()
            Text("$\(String(format: "%.2f", balance))")
                .font(.title3)
                .fontWeight(.bold)
                .padding(.trailing)
        }.padding(5)
            .frame(width: Global.screenWidth * 0.85, height: Global.screenHeight * 0.09)
            .background(RoundedRectangle(cornerRadius: 12).fill(.gray).shadow(radius:20).opacity(0.3))
        
       
    }
}
