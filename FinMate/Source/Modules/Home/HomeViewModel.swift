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
    
    
}
