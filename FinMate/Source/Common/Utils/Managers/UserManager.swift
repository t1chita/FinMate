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
//            BankAccount(
//                backgroundColor: "Blue 7",
//                id: 1,
//                accountNumber: "123456",
//                currency: "GEL",
//                accountName: "My Bank",
//                accountType: .creditCard,
//                balance: 0.0
//            ),
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
//                id: 1,
//                accountId: 1,
//                amount: 200.0,
//                category: .food,
//                date: Date().addingTimeInterval(-60 * 60 * 24 * 2), // 2 days ago
//                description: "Groceries",
//                transactionType: .expense,
//                isRecurring: false,
//                isCompleted: true
//            ),
//            Transaction(
//                id: 2,
//                accountId: 1,
//                amount: 200.0,
//                category: .entertainment,
//                date: Date().addingTimeInterval(-60 * 60 * 24 * 5), // 5 days ago
//                description: "Movie night",
//                transactionType: .expense,
//                isRecurring: false,
//                isCompleted: true
//            ),
//            Transaction(
//                id: 3,
//                accountId: 1,
//                amount: 500.0,
//                category: .entertainment,
//                date: Date().addingTimeInterval(-60 * 60 * 24 * 10), // 10 days ago
//                description: "Freelance Project",
//                transactionType: .income,
//                isRecurring: false,
//                isCompleted: true
//            ),
//            Transaction(
//                id: 4,
//                accountId: 2,
//                amount: 100.0,
//                category: .transportation,
//                date: Date().addingTimeInterval(-60 * 60 * 24 * 15), // 15 days ago
//                description: "Taxi ride",
//                transactionType: .expense,
//                isRecurring: false,
//                isCompleted: true
//            ),
//            Transaction(
//                id: 5,
//                accountId: 2,
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
            BalanceHistory(id: 1, balance: 0, date: Calendar.current.date(from: DateComponents(year: 2024, month: 9, day: 20))!),
            BalanceHistory(id: 2, balance: 0, date: Calendar.current.date(from: DateComponents(year: 2024, month: 9, day: 21))!),
            BalanceHistory(id: 3, balance: 0, date: Calendar.current.date(from: DateComponents(year: 2024, month: 9, day: 22))!),
            BalanceHistory(id: 4, balance: 0, date: Calendar.current.date(from: DateComponents(year: 2024, month: 9, day: 23))!),
            BalanceHistory(id: 5, balance: 0, date: Calendar.current.date(from: DateComponents(year: 2024, month: 9, day: 24))!),
            BalanceHistory(id: 6, balance: 0, date: Calendar.current.date(from: DateComponents(year: 2024, month: 9, day: 25))!),
            BalanceHistory(id: 7, balance: 500.0, date: Calendar.current.date(from: DateComponents(year: 2024, month: 9, day: 26))!),
            BalanceHistory(id: 8, balance: 500.0, date: Calendar.current.date(from: DateComponents(year: 2024, month: 9, day: 27))!),
            BalanceHistory(id: 9, balance: 500.0, date: Calendar.current.date(from: DateComponents(year: 2024, month: 9, day: 28))!),
            BalanceHistory(id: 10, balance: 500.0, date: Calendar.current.date(from: DateComponents(year: 2024, month: 9, day: 29))!),
            BalanceHistory(id: 11, balance: 1000.0, date: Calendar.current.date(from: DateComponents(year: 2024, month: 9, day: 30))!),
            BalanceHistory(id: 12, balance: 150.0, date: Calendar.current.date(from: DateComponents(year: 2024, month: 10, day: 1))!),
            BalanceHistory(id: 13, balance: -350.0, date: Calendar.current.date(from: DateComponents(year: 2024, month: 10, day: 2))!),
            BalanceHistory(id: 14, balance: 450.0, date: Calendar.current.date(from: DateComponents(year: 2024, month: 10, day: 3))!),
            BalanceHistory(id: 15, balance: -800.0, date: Calendar.current.date(from: DateComponents(year: 2024, month: 10, day: 4))!),
            BalanceHistory(id: 16, balance: 0, date: Calendar.current.date(from: DateComponents(year: 2024, month: 10, day: 5))!),
            BalanceHistory(id: 17, balance: 200.0, date: Calendar.current.date(from: DateComponents(year: 2024, month: 10, day: 6))!),
            BalanceHistory(id: 18, balance: -100.0, date: Calendar.current.date(from: DateComponents(year: 2024, month: 10, day: 7))!),
            BalanceHistory(id: 19, balance: -100.0, date: Calendar.current.date(from: DateComponents(year: 2024, month: 10, day: 8))!),
            BalanceHistory(id: 20, balance: -100.0, date: Calendar.current.date(from: DateComponents(year: 2024, month: 10, day: 9))!),
            BalanceHistory(id: 21, balance: -100.0, date: Calendar.current.date(from: DateComponents(year: 2024, month: 10, day: 10))!),
            BalanceHistory(id: 22, balance: 300.0, date: Calendar.current.date(from: DateComponents(year: 2024, month: 10, day: 11))!),
            BalanceHistory(id: 23, balance: -100.0, date: Calendar.current.date(from: DateComponents(year: 2024, month: 10, day: 12))!),
            BalanceHistory(id: 24, balance: 800.0, date: Calendar.current.date(from: DateComponents(year: 2024, month: 10, day: 13))!),
            BalanceHistory(id: 25, balance: 150.0, date: Calendar.current.date(from: DateComponents(year: 2024, month: 10, day: 14))!),
            BalanceHistory(id: 26, balance: -450.0, date: Calendar.current.date(from: DateComponents(year: 2024, month: 10, day: 15))!),
            BalanceHistory(id: 27, balance: 0, date: Calendar.current.date(from: DateComponents(year: 2024, month: 10, day: 16))!),
            BalanceHistory(id: 28, balance: 0, date: Calendar.current.date(from: DateComponents(year: 2024, month: 10, day: 17))!),
            BalanceHistory(id: 29, balance: 0, date: Calendar.current.date(from: DateComponents(year: 2024, month: 10, day: 18))!),
            BalanceHistory(id: 30, balance: -200.0, date: Calendar.current.date(from: DateComponents(year: 2024, month: 10, day: 19))!),
            BalanceHistory(id: 31, balance: 0.0, date: Calendar.current.date(from: DateComponents(year: 2024, month: 10, day: 21))!)
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
