//
//  HomewView.swift
//  PocketPal
//
//  Created by Adrian Faz on 14/06/24.
//

import SwiftUI
import SwiftData

struct HomeView: View {
    @State var showNew: Bool = false
    @Environment(\.dismiss) var dismiss
    @Environment(\.modelContext) var modelContext
    @Query var accounts: [Account]
    @Query var transactions: [Transaction]
    var body: some View {
        NavigationStack {
            VStack (alignment: .leading, spacing: 20) {
                HStack{
                    Text("Welcome,")
                    Text("Adrian")
                        .fontWeight(.bold)
                }.font(.title)
                
                VStack (){
                    HStack{
                        VStack(alignment: .leading, spacing: 5){
                            Text("Current Balance")
                                .foregroundStyle(.beige)
                                .font(.subheadline)
                            
                            
                            Text("$ 300,000.00")
                                .foregroundStyle(.white)
                                .font(.title)
                        }
                        .padding()
                        Spacer()
                    }
                }
                .frame(width: Global.screenWidth*0.85, height: Global.screenHeight * 0.1)
                .background(RoundedRectangle(cornerRadius: 20).fill(.darkGreen))
                
                VStack(alignment: .leading) {
                    Text("Last transactions")
                        .font(.title2)
                    
                    ForEach(transactions.suffix(4)) { trans in
                        
                        IndividualTransaction(transType: trans.type, concept: trans.concept, amount: trans.amount,date: trans.date)
                        
                    }
                    /*
                    IndividualTransaction(transType: .expense, concept: "Galletas OXXO", amount: 22.50)
                    IndividualTransaction(transType: .income, concept: "Galletas OXXO", amount: 22.50)
                    IndividualTransaction(transType: .expense, concept: "Galletas OXXO", amount: 22.50)
                    IndividualTransaction(transType: .income, concept: "Galletas OXXO", amount: 22.50)
                    
                    
                    HStack(spacing: 16) {
                        Image(systemName: "mic.circle.fill")
                            .font(.title)
                            .foregroundStyle(.red)
                        
                        VStack(alignment: .leading) {
                            Text("Galletas OXXO")
                                .fontWeight(.bold)
                            Text("Junio 19")
                                .font(.caption)
                        }
                        
                        Spacer()
                        
                        Text("$22.50")
                            .font(.subheadline)
                            .padding(.trailing)
                    }.padding(10)
                        .frame(width: Global.screenWidth*0.85)
                        .background(RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/).fill(.gray).opacity(0.15))
                    
                    HStack(spacing: 16) {
                        Image(systemName: "mic.circle.fill")
                            .font(.title)
                            .foregroundStyle(.green)
                        
                        VStack(alignment: .leading) {
                            Text("Regalo Abuelos")
                                .fontWeight(.bold)
                            Text("Junio 17")
                                .font(.caption)
                            
                        }
                        
                        Spacer()
                        
                        Text("$200.00")
                            .font(.subheadline)
                            .padding(.trailing)
                        
                    }.padding(10)
                        .frame(width: Global.screenWidth*0.85)
                        .background(RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/).fill(.gray).opacity(0.15))
                    
                    
                    
                    HStack(spacing: 16) {
                        Image(systemName: "mic.circle.fill")
                            .font(.title)
                            .foregroundStyle(.green)
                        
                        VStack(alignment: .leading) {
                            Text("Bono Puntualidad")
                                .fontWeight(.bold)
                            Text("Junio 14")
                                .font(.caption)
                        }
                        
                        Spacer()
                        
                        
                        Text("$500.00")
                            .font(.subheadline)
                            .padding(.trailing)
                        
                    }.padding(10)
                        .frame(width: Global.screenWidth*0.85)
                        .background(RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/).fill(.gray).opacity(0.15))
                    
                    
                    HStack(spacing: 16) {
                        Image(systemName: "mic.circle.fill")
                            .font(.title)
                            .foregroundStyle(.red)
                        
                        VStack(alignment: .leading) {
                            Text("Comida Familiar")
                                .fontWeight(.bold)
                            Text("Junio 14")
                                .font(.caption)
                        }
                        
                        Spacer()
                        
                        Text("$2489.25")
                            .font(.subheadline)
                            .padding(.trailing)
                    }.padding(10)
                        .frame(width: Global.screenWidth*0.85)
                        .background(RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/).fill(.gray).opacity(0.15))
                    
                    */
                    
                }
                
                
                Spacer()
                VStack{
                    Button {
                        showNew.toggle()
                    } label: {
                        Image(systemName: "plus.circle.fill")
                            .foregroundStyle(Color.lightGreen)
                            .font(.system(size: 60))
                    }
                }.frame(width: Global.screenWidth*0.85)
                
                Spacer()
                
                
            }
            .padding()
            .sheet(isPresented: $showNew, content: {
               Locura().presentationDetents([.fraction(0.35)])
            })
        }
    }
}

#Preview {
    HomeView()
}


struct Locura: View {
    @State var voiceOpen: Bool = false
    @State var manualOpen: Bool = false
    var body: some View {
        VStack
        {
            Text("Add a new transaction")
                .font(.title2)
                .fontWeight(.semibold)
                .italic()
                .padding(.bottom)
            HStack(spacing: 40) {
                Button() {
                    voiceOpen = true
                } label: {
                    VStack(spacing: 20) {
                        Image(systemName: "mic.circle.fill")
                            .foregroundStyle(.lightGreen)
                            .font(.system(size: 90))
                        Text("Voice")
                            .font(.title2)
                    }
                }
                
                Button {
                    manualOpen = true
                } label: {
                    VStack(spacing: 20) {
                        Image(systemName: "pencil.circle.fill")
                            .foregroundStyle(.lightGreen)
                            .font(.system(size: 90))
                        Text("Manual")
                            .font(.title2)
                    }
                }
            }
        }.fullScreenCover(isPresented: $voiceOpen) {
            VoiceView()
        }
        .fullScreenCover(isPresented: $manualOpen) {
            NewTransactionView()
        }
    }
}

struct IndividualTransaction: View {
    var transType: TransactionType = .expense
    var concept: String = ""
    var amount: Double
    var date: Date
    
    
    var body: some View {
        
        HStack(spacing: 16) {
            Image(systemName: "mic.circle.fill")
                .font(.title)
                .foregroundStyle(transType == .expense ? .red : .green)
            
            VStack(alignment: .leading) {
                Text(concept)
                    .fontWeight(.bold)
                Text(date.formatted())
                    .font(.caption)
            }
            
            Spacer()
            
            Text("$\(String(format: "%.2f", amount))")
                .font(.subheadline)
                .padding(.trailing)
        }.padding(10)
            .frame(width: Global.screenWidth*0.85)
            .background(RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/).fill(.gray).opacity(0.15))
    }
    
}
