//
//  Transaction.swift
//  FinMate
//
//  Created by Temur Chitashvili on 07.11.24.
//

import Foundation

/// The `Transaction` struct represents an individual financial transaction.
struct Transaction: Identifiable {
    let id: Int // Unique identifier for the transaction
    var accountId: Int // Identifier of the account associated with the transaction
    var amount: Double // The amount of money involved in the transaction
    var category: TransactionCategory // Category of the transaction (e.g., food, transportation)
    var date: Date // The date when the transaction occurred
    var description: String? // Optional description for the transaction (e.g., "Lunch at restaurant")
    var transactionType: TransactionType // Type of the transaction (income or expense)
    var isRecurring: Bool // Whether the transaction is recurring (default is false)
    var isCompleted: Bool // Whether the transaction is completed (default is true)

    /// Initializer for creating a new transaction.
    /// - Parameters:
    ///   - id: Unique identifier for the transaction
    ///   - accountId: Identifier of the account associated with the transaction
    ///   - amount: The amount of money involved in the transaction
    ///   - category: Category of the transaction (e.g., food, transportation)
    ///   - date: The date when the transaction occurred
    ///   - description: Optional description for the transaction
    ///   - transactionType: Type of the transaction (income or expense)
    ///   - isRecurring: Whether the transaction is recurring
    ///   - isCompleted: Whether the transaction is completed
    init(
        id: Int,
        accountId: Int,
        amount: Double,
        category: TransactionCategory,
        date: Date,
        description: String? = nil, // Default value is nil for description
        transactionType: TransactionType,
        isRecurring: Bool = false, // Default is false for recurring
        isCompleted: Bool = true // Default is true for completed
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
    
    /// Computed property to return an emoji representing the transaction category.
    /// This is used for UI display to give a visual representation of the category.
    var emoji: String {
        switch category {
        case .food: return "🍕" // Food category
        case .entertainment: return "🎉" // Entertainment category
        case .health: return "🩺" // Health category
        case .transportation: return "🚗" // Transportation category
        case .education: return "📚" // Education category
        case .shopping: return "🛒" // Shopping category
        case .utilities: return "💡" // Utilities category
        case .savings: return "💰" // Savings category
        case .others: return "📦" // Other/Generic category
        }
    }
    
    /// Computed property to return a background color associated with the transaction category.
    /// This is used for UI display to give a visual representation of the category.
    var backgroundColor: String {
        switch category {
        case .food: return "Blue 10"  
        case .entertainment: return "Blue 5"
        case .health: return "Red 7"
        case .transportation: return "Red 9"
        case .education: return "FMCardColor"
        case .shopping: return "Blue 4"
        case .utilities: return "Red 10"
        case .savings: return "Green 6"
        case .others: return "Green 8"
        }
    }
}

/// Enum representing the type of a transaction: income or expense.
enum TransactionType: String, Hashable {
    case income // Income transaction type
    case expense // Expense transaction type
}

/// Enum representing various categories of transactions.
enum TransactionCategory: String, CaseIterable, Hashable {
    case food // Food-related expenses
    case entertainment // Entertainment-related expenses
    case health // Health-related expenses
    case transportation // Transportation-related expenses
    case education // Education-related expenses
    case shopping // Shopping-related expenses
    case utilities // Utilities-related expenses
    case savings // Savings-related transactions
    case others // Other miscellaneous expenses
}
