//
//  BankAccount.swift
//  FinMate
//
//  Created by Temur Chitashvili on 07.11.24.
//

import Foundation

/// A protocol representing a generic financial account.
///
/// Conforming types must have an ID, account type, account name, balance, and additional properties like currency,
/// background color, creation date, and an icon associated with the account.
protocol Account: Identifiable {
    var id: Int { get }                      // Unique identifier for the account.
    var accountType: AccountType { get }     // Type of account (e.g., credit card, savings).
    var accountName: String { get }          // Name of the account.
    var backgroundColor: String { get }      // Background color for the account UI representation.
    var currency: String { get }             // Currency used for the account balance.
    var balance: Double { get set }          // Current balance of the account.
    var createdAt: Date { get }              // Account creation date.
    var updatedAt: Date { get set }          // Last update date of the account.
    var icon: String { get }                 // Icon representing the account type.
}

/// A struct representing a bank account that conforms to the `Account` protocol.
///
/// This includes properties specific to bank accounts, such as account number.
struct BankAccount: Account {
    var backgroundColor: String               // Background color for the bank account.
    let id: Int                               // Unique identifier for the bank account.
    var accountNumber: String                 // Bank account number.
    var currency: String                      // Currency used for the account balance.
    var accountName: String                   // Name of the bank account.
    var accountType: AccountType              // Type of bank account (e.g., savings, credit).
    var balance: Double                       // Current balance in the bank account.
    var createdAt: Date                       // Account creation date.
    var updatedAt: Date                       // Last updated date for the account.
    
    /// Initializes a new `BankAccount` with the specified properties.
    /// - Parameters:
    ///   - backgroundColor: Background color for the bank account.
    ///   - id: Unique identifier for the bank account.
    ///   - accountNumber: Bank account number.
    ///   - currency: Currency of the account.
    ///   - accountName: Name of the account.
    ///   - accountType: Type of account.
    ///   - balance: Initial balance of the account.
    ///   - createdAt: Creation date (default is current date).
    ///   - updatedAt: Last updated date (default is current date).
    init(
        backgroundColor: String,
        id: Int,
        accountNumber: String,
        currency: String,
        accountName: String,
        accountType: AccountType,
        balance: Double,
        createdAt: Date = Date(),
        updatedAt: Date = Date()
    ) {
        self.backgroundColor = backgroundColor
        self.id = id
        self.accountNumber = accountNumber
        self.currency = currency
        self.accountName = accountName
        self.accountType = accountType
        self.balance = balance
        self.createdAt = createdAt
        self.updatedAt = updatedAt
    }
    
    /// Returns an icon based on the type of account.
    var icon: String {
        switch accountType {
        case .general: return "🏦"
        case .cash: return "💸"
        case .currentAccount: return "🏧"
        case .creditCard: return "💳"
        case .saving: return "🐖"
        case .bonus: return "🎊"
        case .insurance: return "🛡️"
        case .investment: return "📊"
        case .withOverdraft: return "🚨"
        }
    }
}

/// A struct representing a manually added account that conforms to the `Account` protocol.
///
/// This type of account does not include an account number.
struct ManualAccount: Account {
    var backgroundColor: String              // Background color for the manual account.
    let id: Int                              // Unique identifier for the manual account.
    var accountName: String                  // Name of the manual account.
    var currency: String                     // Currency used for the account balance.
    var accountType: AccountType             // Type of manual account (e.g., cash, savings).
    var balance: Double                      // Current balance in the manual account.
    var createdAt: Date                      // Account creation date.
    var updatedAt: Date                      // Last updated date for the account.
    
    /// Initializes a new `ManualAccount` with the specified properties.
    /// - Parameters:
    ///   - backgroundColor: Background color for the manual account.
    ///   - id: Unique identifier for the manual account.
    ///   - accountName: Name of the account.
    ///   - currency: Currency of the account.
    ///   - accountType: Type of account.
    ///   - balance: Initial balance of the account.
    ///   - createdAt: Creation date (default is current date).
    ///   - updatedAt: Last updated date (default is current date).
    init(
        backgroundColor: String,
        id: Int,
        accountName: String,
        currency: String,
        accountType: AccountType,
        balance: Double,
        createdAt: Date = Date(),
        updatedAt: Date = Date()
    ) {
        self.backgroundColor = backgroundColor
        self.id = id
        self.accountName = accountName
        self.currency = currency
        self.accountType = accountType
        self.balance = balance
        self.createdAt = createdAt
        self.updatedAt = updatedAt
    }
    
    /// Returns an icon based on the type of account.
    var icon: String {
        switch accountType {
        case .general: return "🏦"
        case .cash: return "💸"
        case .currentAccount: return "🏧"
        case .creditCard: return "💳"
        case .saving: return "🐖"
        case .bonus: return "🎊"
        case .insurance: return "🛡️"
        case .investment: return "📊"
        case .withOverdraft: return "🚨"
        }
    }
}

/// An enum representing various types of accounts.
///
/// Each account type has a corresponding icon used for UI representation.
enum AccountType: String {
    case general          // General bank account
    case cash             // Cash account
    case currentAccount   // Current account
    case creditCard       // Credit card account
    case saving           // Saving account
    case bonus            // Bonus or rewards account
    case insurance        // Insurance account
    case investment       // Investment account
    case withOverdraft    // Account with overdraft feature
}
