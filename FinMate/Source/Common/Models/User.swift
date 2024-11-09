//
//  User.swift
//  FinMate
//
//  Created by Temur Chitashvili on 07.11.24.
//


import Foundation

struct User: Identifiable {
    let id: UUID
    var name: String
    var email: String
    var profilePictureURL: URL?
    var linkedAccounts: [any Account]
    var budgetLimit: Double?
    var transactions: [Transaction]
    var currency: String
    var balance: Double
    var balanceHistory: [BalanceHistory]
    var createdAt: Date
    var updatedAt: Date

    init(
        id: UUID = UUID(),
        name: String,
        email: String,
        profilePictureURL: URL? = nil,
        linkedAccounts: [any Account] = [],
        currency: String,
        transactions: [Transaction],
        balance: Double,
        balanceHistory: [BalanceHistory],
        createdAt: Date = Date(),
        updatedAt: Date = Date()
    ) {
        self.id = id
        self.name = name
        self.email = email
        self.profilePictureURL = profilePictureURL
        self.linkedAccounts = linkedAccounts
        self.currency = currency
        self.transactions = transactions
        self.balance = balance
        self.balanceHistory = balanceHistory
        self.createdAt = createdAt
        self.updatedAt = updatedAt
    }
}

struct BalanceHistory: Identifiable, Equatable {
    let id: Int
    let balance: Double
    let date: Date
}
