//
//  Playground.swift
//  PocketPal
//
//  Created by Adrian Faz on 21/06/24.
//

import SwiftUI

struct Playground: View {
    var body: some View {
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
                
            }.padding()
        }
    }
}

#Preview {
    Playground()
}
