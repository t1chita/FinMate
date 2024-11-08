//
//  HomeViewModel.swift
//  FinMate
//
//  Created by Temur Chitashvili on 07.11.24.
//

import Foundation

final class HomeViewModel: ObservableObject {
    @Published var accountCardWidth: CGFloat = .zero
    
    func getBalances(from balanceHistory: [BalanceHistory]) -> [Double] {
        return balanceHistory.map { $0.balance }
    }
    
    func getSortedBalances(from balanceHistory: [BalanceHistory]) -> [BalanceHistory] {
        return  balanceHistory.sorted(by: { $0.date < $1.date})
    }
}
