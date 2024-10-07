//
//  VoiceView.swift
//  PocketPal
//
//  Created by Adrian Faz on 20/06/24.
//

import SwiftUI

struct VoiceView: View {
    @State var isSpeaking: Bool = false
    @State var firstTry: Bool = false
    @State var count: Int = 0
    var body: some View {
        VStack (spacing: 20) {
            Button {
                withAnimation {
                    isSpeaking.toggle()
                    count += 1
                    
                    if count == 2 {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.8) {
                            withAnimation(.linear(duration: 0.8)){
                                firstTry = true
                            }
                                }
                        
                    }
                    
                }
            } label: {
                Image(systemName:  isSpeaking ? "stop.circle.fill" : "mic.circle.fill" )
                    .foregroundStyle(.lightGreen)
                    .font(.system(size: firstTry ? 50 : 100))
            }
            
            Text(firstTry ? (isSpeaking ? "Escuchando..." : "Repetir") : (isSpeaking ? "Escuchando..." : "Da click para hablar"))
                .font(firstTry ? .caption : .title3 )
                .fontWeight(.medium)
            if firstTry {
                VStack(spacing: 30){
                    VStack (spacing: 12) {
                        Text("Concepto")
                            .fontWeight(.bold)
                            .font(.title3)
                        
                        Text("Galletas OXXO")
                            .font(.title2)
                    }
                    
                    VStack(spacing: 12) {
                        Text("Cantidad")
                            .fontWeight(.bold)
                            .font(.title3)
                        
                        Text("$22.50")
                            .font(.largeTitle)
                            .fontWeight(.heavy)
                    }
                    
                    VStack(spacing: 20){
                        Text("Método de pago")
                            .fontWeight(.bold)
                            .font(.title3)
                        
                        ScrollView(.horizontal) {
                            HStack (spacing: 15){
                                VStack (spacing: 10) {
                                    Image(systemName: "banknote.fill")
                                        .foregroundStyle(.white)
                                    
                                    Text("Cash")
                                        .foregroundStyle(.white)
                                        .fontWeight(.heavy)
                                        .font(.caption)
                                        .multilineTextAlignment(.center)
                                        
                                }.padding(4)
                                    .frame(width: Global.screenWidth*0.2, height:Global.screenHeight*0.1)
                                    .background(RoundedRectangle(cornerRadius: 12).fill(.darkGreen))
                                
                                
                                PaymentOptionView(accountName: "Cuenta BBVA")
                                PaymentOptionView(accountName: "Moradita NU")
                                PaymentOptionView(accountName: "Moradita NU")
                                
                            }.padding(.horizontal,20)
                        }
                    }.frame(height: Global.screenHeight * 0.20)
                    
                    Button {
                        
                    } label: {
                        Text("Confirmar")
                            .foregroundStyle(.white)
                            .padding(8)
                            .padding(.horizontal,50)
                            .background(RoundedRectangle(cornerRadius: 15))
                            .font(.subheadline)
                            .padding(.vertical)
                            .frame(height: Global.screenHeight*0.18)
                    }
                }.frame(height: Global.screenHeight*0.7)
                
                
                
            } else {
                VStack{
                    Text("Recomendación")
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                        .italic()
                    Text("Menciona el monto que gastaste y explica en qué lo gastaste.")
                        .italic()
                    
                }.frame(width: Global.screenWidth*0.7)
                    .padding()
                //.background(RoundedRectangle(cornerRadius: 20).fill(.lightGreen).opacity(0.3))
                    .padding(.top,70)
                    .font(.subheadline)
            }
            
            
        }
    }
}

#Preview {
    VoiceView()
}

struct PaymentOptionView: View {
    var accountName: String
    var selected: Bool = false
    var body: some View {
        VStack (spacing: 10) {
            Image(systemName: "creditcard.fill")
                .foregroundStyle(.white)
            
            Text(accountName)
                .foregroundStyle(.white)
                .fontWeight(.heavy)
                .font(.caption)
                .multilineTextAlignment(.center)
                
        }.padding(4)
            .frame(width: Global.screenWidth*0.2, height:Global.screenHeight*0.1)
            .background(RoundedRectangle(cornerRadius: 12).fill(selected ? .darkGreen : .lightGreen))
    }
}

