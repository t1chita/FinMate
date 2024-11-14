//
//  LinkedAccountsManager.swift
//  FinMate
//
//  Created by Temur Chitashvili on 14.11.24.
//

import Foundation

/// A class that manages the selection and storage of linked accounts.
///
/// This class is responsible for managing the currently selected account,
/// which can be any type that conforms to the `Account` protocol. It also
/// allows selecting different accounts dynamically.
final class LinkedAccountsManager: ObservableObject {
    
    /// The currently selected account.
    ///
    /// The `@Published` property wrapper ensures that any changes to `selectedAccount`
    /// will automatically trigger UI updates in SwiftUI views that observe this property.
    @Published var selectedAccount: any Account = BankAccount(
        backgroundColor: "Blue 7",      // Default background color
        id: 1,                          // Default ID
        accountNumber: "123456",         // Default account number
        currency: "GEL",                 // Default currency (GEL)
        accountName: "My Bank",          // Default account name
        accountType: .creditCard,        // Default account type (Credit Card)
        balance: 1000.0                  // Default balance
    )
    
    /// Selects a new account as the currently active account.
    ///
    /// - Parameter account: The `Account` object to be selected.
    func selectAccount(_ account: any Account) {
        selectedAccount = account
    }
}
