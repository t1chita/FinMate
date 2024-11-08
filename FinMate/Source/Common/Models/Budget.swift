//
//  Budget.swift
//  FinMate
//
//  Created by Temur Chitashvili on 07.11.24.
//


import Foundation

struct Budget: Identifiable {
    let id: UUID
    var category: TransactionCategory?
    var amountLimit: Double
    var startDate: Date
    var endDate: Date
    var currentSpending: Double
    var notificationsEnabled: Bool
    
    init(id: UUID = UUID(), category: TransactionCategory? = nil, amountLimit: Double, startDate: Date, endDate: Date, currentSpending: Double = 0.0, notificationsEnabled: Bool = true) {
        self.id = id
        self.category = category
        self.amountLimit = amountLimit
        self.startDate = startDate
        self.endDate = endDate
        self.currentSpending = currentSpending
        self.notificationsEnabled = notificationsEnabled
    }
}
