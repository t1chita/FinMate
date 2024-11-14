//
//  User.swift
//  FinMate
//
//  Created by Temur Chitashvili on 07.11.24.
//

import Foundation

/// The `User` struct represents a user in the FinMate app, containing information about the user’s profile, linked accounts, transactions, balance, and history.
struct User: Identifiable {
    let id: UUID // Unique identifier for the user
    var name: String // The user's full name
    var email: String // The user's email address
    var profilePictureURL: URL? // Optional URL for the user's profile picture
    var linkedAccounts: [any Account] // A list of linked accounts associated with the user (can be bank accounts, credit cards, etc.)
    var budgetLimit: Double? // Optional budget limit set by the user (if any)
    var transactions: [Transaction] // A list of the user's transactions
    var currency: String // The currency used by the user (e.g., "USD", "GEL")
    var balance: Double // The current balance of the user
    var balanceHistory: [BalanceHistory] // A history of the user's balance over time
    var createdAt: Date // Date when the user account was created
    var updatedAt: Date // Date when the user's information was last updated

    /// Initializer for creating a new user.
    /// - Parameters:
    ///   - id: Unique identifier for the user
    ///   - name: The user's full name
    ///   - email: The user's email address
    ///   - profilePictureURL: Optional URL for the user's profile picture
    ///   - linkedAccounts: List of accounts linked to the user
    ///   - currency: The currency used by the user
    ///   - transactions: List of transactions associated with the user
    ///   - balance: The current balance of the user
    ///   - balanceHistory: A history of the user's balance over time
    ///   - createdAt: The date when the user was created (default is the current date)
    ///   - updatedAt: The date when the user information was last updated (default is the current date)
    init(
        id: UUID = UUID(),
        name: String,
        email: String,
        profilePictureURL: URL? = nil, // Default value is nil for the profile picture URL
        linkedAccounts: [any Account] = [], // Default value is an empty list for linked accounts
        currency: String,
        transactions: [Transaction],
        balance: Double,
        balanceHistory: [BalanceHistory],
        createdAt: Date = Date(), // Default to current date
        updatedAt: Date = Date() // Default to current date
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


