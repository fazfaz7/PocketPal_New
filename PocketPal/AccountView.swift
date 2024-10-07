//
//  AccountView.swift
//  PocketPal
//
//  Created by Adrian Faz on 21/07/24.
//

import SwiftUI
import SwiftData

struct AccountView: View {
    //var account: Account
    var name: String
    var balance: Double
    var accountId = UUID()
    @Environment(\.modelContext) var modelContext
    @Query var accounts: [Account]
    @Query var transactions: [Transaction]
    var body: some View {
        VStack(spacing: 30) {
            
            HStack {
                Image(systemName: "creditcard")
                    .font(.largeTitle)
                Text(name)
                    .font(.largeTitle)
                    .fontWeight(.bold)
            }.padding().background(RoundedRectangle(cornerRadius: 25).fill(.lightGreen.opacity(0.6)))
            
            Text(String(balance))
                .font(.title)
            Text("Last transactions")
                .font(.title2)
            

            ScrollView {
                ForEach(transactions.filter {$0.accountId == accountId}) { trans in
                    IndividualTransaction(transType: trans.type, concept: trans.concept, amount: trans.amount, date: trans.date)
                }
            }.frame(height: Global.screenHeight/2)
            
        }
    }
}

#Preview {
    AccountView(name: "BBVA", balance: 400.0)
}
