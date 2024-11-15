//
//  BalanceHistory.swift
//  FinMate
//
//  Created by Temur Chitashvili on 14.11.24.
//

import Foundation

/// The `BalanceHistory` struct stores a record of the user's balance at a specific point in time.
struct BalanceHistory: Identifiable, Equatable {
    let id: Int // Unique identifier for the balance history entry
    let balance: Double // The balance value at the given date
    let date: Date // The date when the balance was recorded

    /// Initializer for creating a new balance history entry.
    /// - Parameters:
    ///   - id: Unique identifier for the balance history entry
    ///   - balance: The balance value recorded at the given date
    ///   - date: The date when the balance was recorded
    init(
        id: Int,
        balance: Double,
        date: Date
    ) {
        self.id = id
        self.balance = balance
        self.date = date
    }
}
