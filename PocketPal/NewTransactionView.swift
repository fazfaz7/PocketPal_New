//
//  NewTransactionView.swift
//  PocketPal
//
//  Created by Adrian Faz on 07/07/24.
//

import SwiftUI
import SwiftData

struct NewTransactionView: View {
    @State var name: String = ""
    @State var amount: String = ""
    @State var transactionType: TransactionType = .expense
    @State var selectedPayment: UUID = UUID()
    @State var transactionDate = Date()
    @Environment(\.modelContext) var modelContext
    @Query var accounts: [Account]
    @Query var transactions: [Transaction]
    var body: some View {
        NavigationStack {
            VStack {
                Text("Add New Transaction")
                    .font(.title)
                    .fontWeight(.heavy)
                    .padding()
                
                VStack(spacing: 20) {
                    HStack{
                        VStack(alignment: .leading, spacing: 5){
                            Text("Concept")
                                .fontWeight(.semibold)
                                .font(.title3)
                            
                            TextField("Concept", text: $name)
                                .padding(5)
                                .textFieldStyle(.roundedBorder)
                            
                        }
                        
                        
                        Spacer()
                    }
                    HStack (spacing: 20){
                        HStack{
                            VStack(alignment: .leading, spacing: 5){
                                
                                Text("Amount")
                                    .fontWeight(.semibold)
                                    .font(.title3)
                                
                                TextField("$", text: $amount)
                                    .padding(5)
                                    .textFieldStyle(.roundedBorder)
                                    
                                
                            }
                            
                            VStack(alignment: .leading, spacing: 5) {
                                Text("Type")
                                    .fontWeight(.semibold)
                                    .font(.title3)
                                
                                Picker("Transaction Type", selection: $transactionType) {
                                    ForEach(TransactionType.allCases, id: \.self) { type in
                                                    Text(type.rawValue.capitalized).tag(type)
                                                }
                                            }.padding(5)
                            }
                            
                        }
                        Spacer()
                    }
                    
                    ScrollView(.horizontal) {
                        HStack{
                        ForEach(accounts) { account in
                            
                            PaymentOptionView(accountName: account.name, selected: selectedPayment == account.id).onTapGesture {
                                    withAnimation {
                                        selectedPayment = account.id
                                    }
                                }
                            }
                        }
                    }
                    
                    DatePicker("Date", selection: $transactionDate)
                        .font(.title3)
                        .fontWeight(.semibold)
                    
                    HStack(spacing: 50) {
                        
                        NavigationLink {
                            ContentView()
                                .onAppear {

                                    withAnimation(.linear(duration: 5)) {
                                        
                                        if (name != "" || amount != "") {
                                            let newTransaction = Transaction(accountId: selectedPayment, concept: name, type: transactionType, amount:  Double(amount) ?? 0.00, date: transactionDate)
                                            
                                            
                                            
                                            withAnimation(.linear(duration: 5)) {
                                                
                                                modelContext.insert(newTransaction)
                                                name = ""
                                                amount = ""
                                                
                                            }
                                        }
                                        }
                                        
                                
                                                             
                                                            
                                }
                        } label: {
                            Text("Add Transaction")
                                .padding(10)
                                .foregroundStyle(.white)
                                .background(RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
                                )
                                .padding(.vertical
                                )
                        }
                        
                    }
                }.frame(width: Global.screenWidth * 0.80)
            }
        }
    }
}

#Preview {
    NewTransactionView()
}
