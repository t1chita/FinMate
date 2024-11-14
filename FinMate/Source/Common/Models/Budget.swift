//
//  Budget.swift
//  FinMate
//
//  Created by Temur Chitashvili on 07.11.24.
//

import Foundation

/// A struct representing a budget for tracking expenses within a specified timeframe.
///
/// Each budget has a category (optional), a spending limit, and tracks current spending.
/// Notifications can be enabled to alert users when they are nearing or have reached the limit.
struct Budget: Identifiable {
    
    /// Unique identifier for the budget.
    let id: UUID
    
    /// The category associated with the budget (e.g., food, transportation).
    /// This is optional, as the budget may not always be tied to a specific category.
    var category: TransactionCategory?
    
    /// The maximum spending limit for this budget.
    var amountLimit: Double
    
    /// The start date of the budget period.
    var startDate: Date
    
    /// The end date of the budget period.
    var endDate: Date
    
    /// The current amount spent within the budget period.
    var currentSpending: Double
    
    /// A flag indicating whether notifications are enabled for this budget.
    /// If enabled, users will be notified when they approach or exceed the limit.
    var notificationsEnabled: Bool
    
    /// Initializes a new `Budget` with the specified properties.
    ///
    /// - Parameters:
    ///   - id: A unique identifier for the budget (default is a new UUID).
    ///   - category: The category associated with the budget (default is `nil`).
    ///   - amountLimit: The maximum spending limit for the budget.
    ///   - startDate: The start date of the budget period.
    ///   - endDate: The end date of the budget period.
    ///   - currentSpending: The current spending amount (default is 0.0).
    ///   - notificationsEnabled: A flag to enable or disable notifications (default is `true`).
    init(
        id: UUID = UUID(),
        category: TransactionCategory? = nil,
        amountLimit: Double,
        startDate: Date,
        endDate: Date,
        currentSpending: Double = 0.0,
        notificationsEnabled: Bool = true
    ) {
        self.id = id
        self.category = category
        self.amountLimit = amountLimit
        self.startDate = startDate
        self.endDate = endDate
        self.currentSpending = currentSpending
        self.notificationsEnabled = notificationsEnabled
    }
}
