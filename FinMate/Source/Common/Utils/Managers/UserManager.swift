//
//  UserManager.swift
//  FinMate
//
//  Created by Temur Chitashvili on 07.11.24.
//

import SwiftUI

final class UserManager: ObservableObject {
    @Published var user: User = User(
        id: UUID(),
        name: "Temur",
        email: "t1chitashvili@gmail.com",
        profilePictureURL: URL(string:"https://avatars.githubusercontent.com/u/149577859?s=400&u=2251c5f11028efa4f1b59ee32aba7c422c0748ee&v=4"),
        linkedAccounts: [
            BankAccount(
                backgroundColor: "Blue 7",
                id: 1,
                accountNumber: "123456",
                currency: "GEL",
                accountName: "My Bank",
                accountType: .creditCard,
                balance: 0.0
            ),
//            ManualAccount(
//                backgroundColor: "Green 4",
//                id: 2,
//                accountName: "Cash Wallet",
//                currency: "GEL",
//                accountType: .cash,
//                balance: 500.0
//            )
        ],
        currency: "GEL",
        transactions: [
//            Transaction(
//                accountId: UUID(),
//                amount: 200.0,
//                category: .food,
//                date: Date().addingTimeInterval(-60 * 60 * 24 * 2), // 2 days ago
//                description: "Groceries",
//                transactionType: .expense,
//                isRecurring: false,
//                isCompleted: true
//            ),
//            Transaction(
//                accountId: UUID(),
//                amount: 200.0,
//                category: .entertainment,
//                date: Date().addingTimeInterval(-60 * 60 * 24 * 5), // 5 days ago
//                description: "Movie night",
//                transactionType: .expense,
//                isRecurring: false,
//                isCompleted: true
//            ),
//            Transaction(
//                accountId: UUID(),
//                amount: 500.0,
//                category: .entertainment,
//                date: Date().addingTimeInterval(-60 * 60 * 24 * 10), // 10 days ago
//                description: "Freelance Project",
//                transactionType: .income,
//                isRecurring: false,
//                isCompleted: true
//            ),
//            Transaction(
//                accountId: UUID(),
//                amount: 100.0,
//                category: .transportation,
//                date: Date().addingTimeInterval(-60 * 60 * 24 * 15), // 15 days ago
//                description: "Taxi ride",
//                transactionType: .expense,
//                isRecurring: false,
//                isCompleted: true
//            ),
//            Transaction(
//                accountId: UUID(),
//                amount: 500.0,
//                category: .utilities,
//                date: Date().addingTimeInterval(-60 * 60 * 24 * 20), // 20 days ago
//                description: "Electricity Bill",
//                transactionType: .expense,
//                isRecurring: true,
//                isCompleted: true
//            )
        ],
        balance: 0.0,
        balanceHistory: [
            BalanceHistory(balance: -100, date: Date().addingTimeInterval(-60 * 60 * 24 * 20)),
            BalanceHistory(balance: 300, date: Date().addingTimeInterval(-60 * 60 * 24 * 15)),
            BalanceHistory(balance: -800, date: Date().addingTimeInterval(-60 * 60 * 24 * 5)),
            BalanceHistory(balance: 900, date: Date().addingTimeInterval(-60 * 60 * 24 * 2)),
            BalanceHistory(balance: 0, date: Date().addingTimeInterval(-60 * 60 * 24 * 50)),
        ],
        createdAt: Date(),
        updatedAt: Date()
    )
}

final class LinkedAccountsManager: ObservableObject {
    @Published var selectedAccount: any Account =  BankAccount(
        backgroundColor: "Blue 7",
        id: 1,
        accountNumber: "123456",
        currency: "GEL",
        accountName: "My Bank",
        accountType: .creditCard,
        balance: 1000.0
    )
    
    func selectAccount(_ account: any Account) {
        selectedAccount = account
    }
}
