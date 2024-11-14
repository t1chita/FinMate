//
//  HomeViewModel.swift
//  FinMate
//
//  Created by Temur Chitashvili on 07.11.24.
//

import Foundation

final class HomeViewModel: ObservableObject {
    @Published var accountCardWidth: CGFloat = .zero
    @Published var plotWidth: CGFloat = 0
    
    @Published var currentTab: String = "Last Month"
    @Published var categoriesChart: String = "Expanded"
    
    @Published var currentChosenBalanceHistory: BalanceHistory?
    
    func getBalances(from balanceHistory: [BalanceHistory]) -> [Double] {
        return balanceHistory.map { $0.balance }
    }
    
    func getSortedBalances(from balanceHistory: [BalanceHistory]) -> [BalanceHistory] {
        return  balanceHistory.sorted(by: { $0.date < $1.date})
    }
    
    func getAverageOfWholeBalance(from balanceHistory: [BalanceHistory]) -> Double {
        let quantity = balanceHistory.count
        var sum: Double = 0
        for balance in balanceHistory {
            sum += balance.balance
        }
        return sum / Double(quantity)
    }
    
    func getMax(from balanceHistory: [BalanceHistory]) -> Double {
        return balanceHistory.map { $0.balance }.max() ?? 0
    }
    
    func getMin(from balanceHistory: [BalanceHistory]) -> Double {
        return balanceHistory.map { $0.balance }.min() ?? 0
    }
    
    func getAccount(with id: Int, in accounts: [any Account]) -> any Account {
        return accounts.first(where: {$0.id == id} )!
    }
    
    func getTransactionsReadyForPieChart(_ transactions: [Transaction]) -> [PieChartData] {
        // Step 1: Filter transactions based on the selected category (Expanded or Income)
        let filteredTransactions = transactions.filter { transaction in
            switch categoriesChart {
            case "Expanded":
                return transaction.transactionType == .expense
            case "Income":
                return transaction.transactionType == .income
            default:
                return true
            }
        }
        
        // Step 2: Group transactions by category and type, then calculate the total amount per group
        let groupedData = Dictionary(grouping: filteredTransactions) { TransactionKey(category: $0.category, type: $0.transactionType) }
            .mapValues { transactions in
                transactions.reduce(0) { $0 + $1.amount }
            }
        
        // Step 3: Convert the grouped data into an array of `PieChartData`
        let pieChartData = groupedData.map { (key, totalAmount) in
            PieChartData(category: key.category, type: key.type, totalAmount: totalAmount)
        }
        
        // Step 4: Sort data if needed (e.g., by total amount in descending order)
        return pieChartData.sorted { $0.totalAmount > $1.totalAmount }
    }
}



struct TransactionKey: Hashable {
    let category: TransactionCategory
    let type: TransactionType
    
    // Implementing `Hashable` manually:
    func hash(into hasher: inout Hasher) {
        hasher.combine(category)
        hasher.combine(type)
    }
    
    // Conformance to Equatable (which is automatically derived by Swift)
    static func ==(lhs: TransactionKey, rhs: TransactionKey) -> Bool {
        return lhs.category == rhs.category && lhs.type == rhs.type
    }
}
