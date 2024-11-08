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
                balance: 1000.0
            ),
            ManualAccount(
                backgroundColor: "Green 4",
                id: 2,
                accountName: "Cash Wallet",
                currency: "GEL",
                accountType: .cash,
                balance: 500.0
            )
        ],
        currency: "GEL",
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
