//
//  Goal.swift
//  FinMate
//
//  Created by Temur Chitashvili on 07.11.24.
//

import Foundation

/// A struct representing a financial goal, such as saving for a trip or a big purchase.
///
/// A goal has a unique identifier, a title, target amount, current saved amount, due date,
/// an optional category, and a completion status.
struct Goal: Identifiable {
    
    /// Unique identifier for the goal.
    let id: UUID
    
    /// The title of the goal (e.g., "Vacation Fund", "Emergency Savings").
    var title: String
    
    /// The target amount to reach for this goal.
    var targetAmount: Double
    
    /// The current amount saved towards the goal.
    var currentAmount: Double
    
    /// The due date by which the goal should be achieved.
    var dueDate: Date
    
    /// An optional category to associate this goal with a specific type of transaction (e.g., "Travel", "Education").
    var category: TransactionCategory?
    
    /// A flag indicating whether the goal has been completed (`true`) or not (`false`).
    var isCompleted: Bool
    
    /// Initializes a new `Goal` with the specified properties.
    ///
    /// - Parameters:
    ///   - id: A unique identifier for the goal (default is a new UUID).
    ///   - title: The title of the goal.
    ///   - targetAmount: The target amount to reach for the goal.
    ///   - currentAmount: The current amount saved towards the goal (default is `0.0`).
    ///   - dueDate: The due date by which the goal should be achieved.
    ///   - category: An optional category associated with the goal (default is `nil`).
    ///   - isCompleted: A flag indicating if the goal is completed (default is `false`).
    init(
        id: UUID = UUID(),
        title: String,
        targetAmount: Double,
        currentAmount: Double = 0.0,
        dueDate: Date,
        category: TransactionCategory? = nil,
        isCompleted: Bool = false
    ) {
        self.id = id
        self.title = title
        self.targetAmount = targetAmount
        self.currentAmount = currentAmount
        self.dueDate = dueDate
        self.category = category
        self.isCompleted = isCompleted
    }
}
