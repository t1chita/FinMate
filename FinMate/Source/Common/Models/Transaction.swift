//
//  Transaction.swift
//  FinMate
//
//  Created by Temur Chitashvili on 07.11.24.
//


import Foundation

struct Transaction: Identifiable {
    let id: Int
    var accountId: Int
    var amount: Double
    var category: TransactionCategory
    var date: Date
    var description: String?
    var transactionType: TransactionType
    var isRecurring: Bool
    var isCompleted: Bool
    
    init(
        id: Int,
        accountId: Int,
        amount: Double,
        category: TransactionCategory,
        date: Date,
        description: String? = nil,
        transactionType: TransactionType,
        isRecurring: Bool = false,
        isCompleted: Bool = true
    ) {
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
    
    var emoji: String {
        switch category {
        case .food: return "🍕"
        case .entertainment: return "🎉"
        case .health: return "🩺"
        case .transportation: return "🚗"
        case .education: return "📚"
        case .shopping: return "🛒"
        case .utilities: return "💡"
        case .savings: return "💰"
        case .others: return "📦"
        }
    }
    
    var backgroundColor: String {
        switch category {
        case .food: return "Blue 10" // Gold
        case .entertainment: return "Blue 5" // Pink
        case .health: return "Red 7" // Lime Green
        case .transportation: return "Red 9" // Dodger Blue
        case .education: return "FMCardColor" // Blue Violet
        case .shopping: return "Blue 4" // Tomato
        case .utilities: return "Red 10" // Orange
        case .savings: return "Green 6" // Forest Green
        case .others: return "Green 8" // Dark Gray
        }
    }
}

enum TransactionType: String, Hashable {
    case income
    case expense
}

enum TransactionCategory: String, CaseIterable, Hashable {
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
