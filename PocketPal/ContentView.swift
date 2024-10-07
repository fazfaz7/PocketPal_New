//
//  ContentView.swift
//  PocketPal
//
//  Created by Adrian Faz on 20/06/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            TabView {
                HomeView()
                    .tabItem {
                        Label("Home", systemImage: "house.fill")
                    }
                
                HomeView()
                    .tabItem {
                        Label("My Subscriptions", systemImage: "arrow.counterclockwise")
                    }
                
                AccountsView()
                    .tabItem {
                        Label("My Accounts", systemImage: "creditcard")
                            
                    }
            }
            
        }.navigationBarBackButtonHidden()
    }
}

#Preview {
    ContentView()
}
