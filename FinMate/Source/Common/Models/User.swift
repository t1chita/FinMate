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
    var currency: String
    var createdAt: Date
    var updatedAt: Date

    init(id: UUID = UUID(), name: String, email: String, profilePictureURL: URL? = nil, linkedAccounts: [any Account] = [], currency: String, createdAt: Date = Date(), updatedAt: Date = Date()) {
        self.id = id
        self.name = name
        self.email = email
        self.profilePictureURL = profilePictureURL
        self.linkedAccounts = linkedAccounts
        self.currency = currency
        self.createdAt = createdAt
        self.updatedAt = updatedAt
    }
}


