//
//  HomeView.swift
//  FinMate
//
//  Created by Temur Chitashvili on 07.11.24.
//

import SwiftUI
import Charts

struct HomeView: View {
    @StateObject var homeViewModel: HomeViewModel
    @EnvironmentObject var userManager: UserManager
    @EnvironmentObject var linkedAccountsManager: LinkedAccountsManager
    var body: some View {
        ZStack {
            // Background Color
            Color.fmPrimary
                .ignoresSafeArea()
            
            VStack {
                greetingText
                
                cardsView
                
                balanceTrendCard
                
                Spacer()
            }
            .padding(AppConstants.Paddings.medium)
        }
    }
    
    private var greetingText: some View {
        HStack {
            FMText(
                content: "Hello,",
                font: .title,
                color: .primaryText,
                fontWeight: .bold
            )
            FMText(
                content: userManager.user.name + "!",
                font: .title,
                color: .fmAccentLighter,
                fontWeight: .bold
            )
            
            Spacer()
            
            AsyncImage(url: userManager.user.profilePictureURL) { image in
                image
                    .resizable()
                    .frame(width: 40, height: 40)
                    .clipShape(Circle())
            } placeholder: {
                ProgressView()
            }
        }
    }
    
    private var cardsView: some View {
        linkedAccountsCards
            .padding(AppConstants.Paddings.medium)
            .background(
                FMCardView(
                    foregroundColor: .fmSecondary,
                    cornerRadius: AppConstants.CornerRadius.large,
                    shadowColor: .clear,
                    shadowRadius: 0,
                    contentAlignment: .center,
                    strokeColor: nil,
                    strokeWidth: nil
                )
            )
    }
    
    private var linkedAccountsCards: some View {
        ScrollView(.horizontal) {
            HStack {
                LazyHStack {
                    ForEach(userManager.user.linkedAccounts.indices, id: \.self) { index in
                        accountCell(at: index)
                    }
                }
                
                addLinkedAccountButton
            }
        }
        .frame(width: .infinity, height: 120)
        .padding(.vertical, AppConstants.Paddings.small)
        .scrollIndicators(.hidden)
    }
    
    private func accountCell(at index: Int) -> some View {
        HStack {
            VStack(alignment: .leading, spacing: AppConstants.Paddings.tiny) {
                FMText(content: userManager.user.linkedAccounts[index].icon)
                    .padding(.horizontal, AppConstants.Paddings.tiny)
                    .background(
                        FMCardView(
                            foregroundColor: Color(userManager.user.linkedAccounts[index].backgroundColor),
                            cornerRadius: AppConstants.CornerRadius.small,
                            shadowColor: .clear,
                            shadowRadius: 0,
                            contentAlignment: .center,
                            strokeColor: nil,
                            strokeWidth: nil
                        )
                    )
                
                FMText(
                    content: userManager.user.linkedAccounts[index].accountName,
                    font: .caption,
                    color: .secondaryText,
                    fontWeight: .regular
                )
                
                VStack(alignment: .leading) {
                    FMText(
                        content: String(userManager.user.linkedAccounts[index].balance),
                        font: .body,
                        color: .primaryDarkText,
                        fontWeight: .bold
                    )
                    
                    FMText(
                        content: userManager.user.linkedAccounts[index].currency,
                        font: .title3,
                        color: .primaryDarkText,
                        fontWeight: .regular
                    )
                }
            }
            
            Spacer()
        }
        .padding()
        .frame(width: homeViewModel.accountCardWidth)
        .background(
            FMCardView(
                foregroundColor: .primaryText,
                cornerRadius: AppConstants.CornerRadius.medium,
                shadowColor: .clear,
                shadowRadius: 0,
                contentAlignment: .center,
                strokeColor: nil,
                strokeWidth: nil
            )
        )
    }
    
    private var addLinkedAccountButton: some View {
        FMButton(
            action: { },
            foregroundColor: .clear,
            cornerRadius: AppConstants.CornerRadius.medium,
            shadowColor: .clear,
            shadowRadius: 0,
            contentAlignment: .center,
            strokeColor: .blue10,
            strokeWidth: 1) {
                VStack {
                    Image(.plus)
                        .resizable()
                        .frame(width: 20, height: 20)
                    
                    FMText(
                        content: "Add Account",
                        font: .body,
                        color: .primaryText,
                        fontWeight: .bold
                    )
                }
                .padding(AppConstants.Paddings.medium)
                .frame(height: 120)
            }
            .modifier(GetWidthModifier(width: $homeViewModel.accountCardWidth))
    }
    
    private var balanceTrendCard: some View {
        ScrollView {
            VStack {
                balanceTrendCardHeader
                
                Divider()
                    .padding(.horizontal, -16)
                
                chartForBalanceTrendCard
            }
            .padding(AppConstants.Paddings.medium)
            .background(
                FMCardView(
                    foregroundColor: .blue8,
                    cornerRadius: AppConstants.CornerRadius.medium,
                    shadowColor: .clear,
                    shadowRadius: 0,
                    contentAlignment: .center,
                    strokeColor: nil,
                    strokeWidth: nil
                )
            )
            .frame(maxWidth: .infinity)
            .frame(height: 300) // Adjust the height as needed

        }
    }
    private var balanceTrendCardHeader: some View {
        HStack {
            FMText(
                content: "Budget Trend",
                font: .body,
                color: .primaryDarkText,
                fontWeight: .bold
            )
            
            Spacer()
            
            ThreeDotsButton() {
                print("ThreeDot")
            }
        }
    }
    
    @ViewBuilder
    private var chartForBalanceTrendCard: some View {
        if !userManager.user.balanceHistory.isEmpty {
            Chart(homeViewModel.getSortedBalances(from: userManager.user.balanceHistory)) { balance in
                LineMark(
                    x: .value("WeekDay", balance.date),
                    y: .value("Count", balance.balance)
                )
                .foregroundStyle(.blue1)
                .interpolationMethod(.catmullRom)
                .lineStyle(.init(lineWidth: 2))
                .symbol {
                    Circle()
                        .fill(.blue1)
                        .frame(width: 12, height: 12)
                }
            }
        } else {
            Chart {
                RuleMark(y: .value("Zero Line", 0))
                    .lineStyle(StrokeStyle(lineWidth: 2, dash: [5]))
                    .foregroundStyle(.gray)
            }
        }
    }
}

struct ThreeDotsButton: View {
    let action: () -> Void
    
    init(action: @escaping () -> Void) {
        self.action = action
    }
    
    var body: some View {
        Button {
            action()
        } label: {
            Image(systemName: "ellipsis.circle.fill")
                .foregroundStyle(.primaryDarkText)
        }
    }
}

struct MoneyTransferLineChartView: View {
    let transferData = [
        (date: "2024-10-01", amount: 500),
        (date: "2024-10-02", amount: -200),
        (date: "2024-10-03", amount: 150),
        (date: "2024-10-04", amount: 300),
        (date: "2024-10-05", amount: -450)
    ]
    
    var body: some View {
        Chart {
            ForEach(transferData, id: \.date) { transfer in
                LineMark(
                    x: .value("Date", transfer.date),
                    y: .value("Transferred Amount", transfer.amount)
                )
            }
        }
        .frame(width: 300, height: 300)
        .padding()
        .navigationTitle("Money Transfer Over Time")
    }
}
#Preview {
    HomeView(homeViewModel: HomeViewModel())
        .environmentObject(UserManager())
        .environmentObject(LinkedAccountsManager())
}


#Preview {
    MoneyTransferLineChartView()
}

