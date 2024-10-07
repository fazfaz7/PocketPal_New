//
//  Account.swift
//  PocketPal
//
//  Created by Adrian Faz on 06/07/24.
//

import Foundation
import SwiftUI
import SwiftData

@Model
class Account: Identifiable {
    
    let id = UUID()
    var name: String
    var type: AccountType
    //var color: Color
    var balance: Double
    var cutoffDate: String?
    
    init(name: String = "", type: AccountType = .credit/*, color: String = "red"*/, balance: Double = 0.0) {
        self.name = name
        self.type = type
        //self.color = color
        self.balance = balance
    }
}

@Model
class Transaction: Identifiable {
    var id = UUID()
    var accountId: UUID
    var concept: String
    var type: TransactionType
    var amount: Double
    var date: Date
    
    init(id: UUID = UUID(), accountId: UUID = UUID(), concept: String = "", type: TransactionType = .income, amount: Double = 0.0, date: Date = Date()) {
        self.id = id
        self.accountId = accountId
        self.concept = concept
        self.type = type
        self.amount = amount
        self.date = date
    }
}


enum AccountType: String, Codable, CaseIterable{
    case credit
    case debit
}

enum TransactionType: String, Codable, CaseIterable {
    case income
    case expense
}
