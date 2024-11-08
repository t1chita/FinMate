//
//  BankAccount.swift
//  FinMate
//
//  Created by Temur Chitashvili on 07.11.24.
//


import Foundation

protocol Account: Identifiable {
    var id: Int { get }
    var accountType: AccountType { get }
    var accountName: String { get }
    var backgroundColor: String { get }
    var currency: String { get }
    var balance: Double { get set }
    var createdAt: Date { get }
    var updatedAt: Date { get set }
    var icon: String { get }
}

struct BankAccount: Account {
    var backgroundColor: String
    let id: Int
    var accountNumber: String
    var currency: String
    var accountName: String
    var accountType: AccountType
    var balance: Double
    var createdAt: Date
    var updatedAt: Date
    
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
    
    var icon: String {
        switch accountType {
        case .general:
            return "🏦" // General account
        case .cash:
            return "💸" // Cash
        case .currentAccount:
            return "🏧" // Current Account
        case .creditCard:
            return "💳" // Credit Card
        case .saving:
            return "🐖" // Saving Account (Piggy Bank)
        case .bonus:
            return "🎊" // Bonus Account (Celebration)
        case .insurance:
            return "🛡️" // Insurance Account (Shield)
        case .investment:
            return "📊" // Investment Account (Chart)
        case .withOverdraft:
            return "🚨" // Account with Overdraft (Warning)
        }
    }
}

struct ManualAccount: Account {
    var backgroundColor: String
    let id: Int
    var accountName: String
    var currency: String
    var accountType: AccountType
    var balance: Double
    var createdAt: Date
    var updatedAt: Date
    
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
    
    var icon: String {
        switch accountType {
        case .general:
            return "🏦" // General account
        case .cash:
            return "💸" // Cash
        case .currentAccount:
            return "🏧" // Current Account
        case .creditCard:
            return "💳" // Credit Card
        case .saving:
            return "🐖" // Saving Account (Piggy Bank)
        case .bonus:
            return "🎊" // Bonus Account (Celebration)
        case .insurance:
            return "🛡️" // Insurance Account (Shield)
        case .investment:
            return "📊" // Investment Account (Chart)
        case .withOverdraft:
            return "🚨" // Account with Overdraft (Warning)
        }
    }
}


enum AccountType: String {
    case general
    case cash
    case currentAccount
    case creditCard
    case saving
    case bonus
    case insurance
    case investment
    case withOverdraft
}
