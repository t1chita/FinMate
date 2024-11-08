//
//  Transaction.swift
//  FinMate
//
//  Created by Temur Chitashvili on 07.11.24.
//


import Foundation

struct Transaction: Identifiable {
    let id: UUID
    var accountId: UUID
    var amount: Double
    var category: TransactionCategory
    var date: Date
    var description: String?
    var transactionType: TransactionType
    var isRecurring: Bool
    var isCompleted: Bool
    
    init(id: UUID = UUID(), accountId: UUID, amount: Double, category: TransactionCategory, date: Date, description: String? = nil, transactionType: TransactionType, isRecurring: Bool = false, isCompleted: Bool = true) {
        self.id = id
        self.accountId = accountId
        self.amount = amount
        self.category = category
        self.date = date
        self.description = description
        self.transactionType = transactionType
        self.isRecurring = isRecurring
        self.isCompleted = isCompleted
    }
}

enum TransactionType: String {
    case income
    case expense
}

enum TransactionCategory: String, CaseIterable {
    case food
    case entertainment
    case health
    case transportation
    case education
    case shopping
    case utilities
    case savings
    case others
}
