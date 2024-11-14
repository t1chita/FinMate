//
//  PieChartData.swift
//  FinMate
//
//  Created by Temur Chitashvili on 14.11.24.
//

import Foundation

/// A model representing the data used to create a pie chart visualization.
///
/// This struct is used to hold the data for a pie chart segment, including the
/// category and type of the transaction, as well as the total amount for that segment.
struct PieChartData: Identifiable {
    
    /// Unique identifier for each PieChartData entry.
    let id = UUID()
    
    /// The category of the transaction (e.g., "Food", "Entertainment").
    let category: TransactionCategory
    
    /// The type of transaction (e.g., "Income", "Expense").
    let type: TransactionType
    
    /// The total amount associated with this category and transaction type.
    let totalAmount: Double
}
