//
//  PocketPalApp.swift
//  PocketPal
//
//  Created by Adrian Faz on 14/06/24.
//

import SwiftUI
import SwiftData

@main
struct PocketPalApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: [Account.self, Transaction.self])
    }
}
