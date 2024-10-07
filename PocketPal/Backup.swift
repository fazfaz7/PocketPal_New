//
//  NewAccountView.swift
//  PocketPal
//
//  Created by Adrian Faz on 22/06/24.
//
/*
import SwiftUI
import SwiftData

struct NewAccountView: View {
    @State var cardName: String = ""
    @State var balance: String = ""
    @State var accountType: AccountType = .debit
    @Environment(\.modelContext) var modelContext
    @Query var accounts: [Account]
    @Query var transactions: [Transaction]
    var body: some View {
        NavigationStack {
            VStack {
                Text("New Account")
                    .font(.title)
                    .fontWeight(.heavy)
                ZStack{
                    HStack {
                        VStack(spacing: 15) {
                            HStack{
                                VStack(alignment: .leading, spacing: 5){
                                    Text("Card Name")
                                        .fontWeight(.semibold)
                                        .font(.title3)
                                    
                                    TextField("Card Name", text: $cardName)
                                        .frame(width: Global.screenWidth*0.5)
                                                                        
                                }
                                Spacer()
                            }.padding(.horizontal)
                            
                            
                            HStack{
                                VStack(alignment: .leading, spacing: 5){
                                    Text("Initial Balance")
                                        .fontWeight(.semibold)
                                        .font(.title3)
                                    
                                    
                                    TextField("Initial Balance", text: $balance)
                                        .frame(width: Global.screenWidth*0.5)
                                }
                                Spacer()
                            }.padding(.horizontal)
                            
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
                            }.padding(.horizontal)
                            

                            
                            Spacer()
                        }.frame(width: Global.screenWidth * 0.75)
                            .padding(.top,Global.screenHeight*0.1)
                    }.frame(width: Global.screenWidth * 0.75, height: Global.screenHeight*0.3)
                        .background(RoundedRectangle(cornerRadius: 10).fill(.white).stroke(.black, lineWidth: 0.3))
                        .offset(x: 0, y: Global.screenHeight*0.16)
                        .shadow(radius: 15)
                    
                    
                    HStack {
                    }
                    .frame(width: Global.screenWidth * 0.50, height: Global.screenHeight * 0.14)
                    .background(RoundedRectangle(cornerRadius: 15).fill(.purple).stroke(.gray, lineWidth: 0.5))
                    
                    
                }
                
                
                
                Spacer()
                
                HStack(spacing: 50) {
                    NavigationLink {
                        AccountsView()
                    } label: {
                        Text("Cancelar")
                            .fontWeight(.medium)
                    }
                    
                    NavigationLink {
                        AccountsView()
                            .onAppear {
                                
                                withAnimation(.linear(duration: 5)) {
                                    let newAccount = Account(name: cardName, type: .debit, balance: Double(balance) ?? 0.00)
                                    
                                    modelContext.insert(newAccount)
                                    
                                }
                                                         
                                                        
                            }
                    } label: {
                        Text("Crear Cuenta")
                            .padding(10)
                            .foregroundStyle(.white)
                            .background(RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
                            )
                    }
                    
                }
                
                Spacer()
                
                
            }
            
        }
    }
}

#Preview {
    NewAccountView(cardName: "")
}
*/
