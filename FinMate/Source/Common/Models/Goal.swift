//
//  Goal.swift
//  FinMate
//
//  Created by Temur Chitashvili on 07.11.24.
//


import Foundation

struct Goal: Identifiable {
    let id: UUID
    var title: String
    var targetAmount: Double
    var currentAmount: Double
    var dueDate: Date
    var category: TransactionCategory?
    var isCompleted: Bool
    
    init(id: UUID = UUID(), title: String, targetAmount: Double, currentAmount: Double = 0.0, dueDate: Date, category: TransactionCategory? = nil, isCompleted: Bool = false) {
        self.id = id
        self.title = title
        self.targetAmount = targetAmount
        self.currentAmount = currentAmount
        self.dueDate = dueDate
        self.category = category
        self.isCompleted = isCompleted
    }
}
