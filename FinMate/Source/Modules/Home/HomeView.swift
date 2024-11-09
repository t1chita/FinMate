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
        .frame(maxWidth: .infinity)
        .frame(height: 120)
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
            .frame(height: 250)
        }
    }
    private var balanceTrendCardHeader: some View {
        VStack(alignment: .leading) {
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
//            
//            Picker("", selection: $homeViewModel.currentTab) {
//                FMText(
//                    content: "7 Days",
//                    font: .body,
//                    color: .primaryDarkText,
//                    fontWeight: .bold
//                )
//                .tag("7 Days")
//
//                FMText(
//                    content: "Last Month",
//                    font: .body,
//                    color: .primaryDarkText,
//                    fontWeight: .bold
//                )
//                .tag("Last Month")
//                
//                FMText(
//                    content: "3 Month",
//                    font: .body,
//                    color: .primaryDarkText,
//                    fontWeight: .bold
//                )
//                .tag("3 Month")
//            }
//            .pickerStyle(.segmented)
        }
    }
    
    @ViewBuilder
    private var chartForBalanceTrendCard: some View {
        if !userManager.user.balanceHistory.isEmpty {
            let sortedBalances = homeViewModel.getSortedBalances(from: userManager.user.balanceHistory)
            VStack {
                Chart(sortedBalances) { balance in
                    LineMark(
                        x: .value("WeekDay", balance.date),
                        y: .value("Count", balance.balance)
                    )
                    .foregroundStyle(.blue1.gradient)
                    .interpolationMethod(.catmullRom)
                    .lineStyle(.init(lineWidth: 4))
                    
                    AreaMark(
                        x: .value("WeekDay", balance.date),
                        y: .value("Count", balance.balance)
                    )
                    .foregroundStyle(.blue1.opacity(0.3).gradient)
                    .interpolationMethod(.catmullRom)
                    
                    if let chosenHistory = homeViewModel.currentChosenBalanceHistory, chosenHistory.id == balance.id {
                        RuleMark(x: .value("Date", chosenHistory.date))
                            .lineStyle(.init(lineWidth: 2, miterLimit: 2, dash: [2], dashPhase: 5))
                            .annotation(position: .bottom) {
                                VStack(alignment: .leading, spacing: 6) {
                                    FMText(
                                        content: "Amount",
                                        font: .body,
                                        color: .primaryDarkText,
                                        fontWeight: .regular
                                    )
                                    FMText(
                                        content: String(chosenHistory.balance.stringFormat) + " " + userManager.user.currency,
                                        font: .callout,
                                        color: .primaryDarkText,
                                        fontWeight: .bold
                                    )
                                }
                                .padding(AppConstants.Paddings.small)
                                .background(
                                    FMCardView(
                                        foregroundColor: .primaryText,
                                        cornerRadius: AppConstants.CornerRadius.small,
                                        shadowColor: .clear,
                                        shadowRadius: 0,
                                        contentAlignment: .center,
                                        strokeColor: nil,
                                        strokeWidth: nil
                                    )
                                )
                            }
                    }
                }
                .chartXAxis {
                    AxisMarks(preset: .inset, values: .stride(by: .day, count: 5)) { value in
                        AxisValueLabel(format: .dateTime.month(.twoDigits).day(.twoDigits))
                    }
                }
                .chartOverlay { proxy in
                    GeometryReader { innerProxy in
                        Rectangle()
                            .fill(.clear)
                            .contentShape(Rectangle())
                            .gesture (
                                DragGesture()
                                    .onChanged { value in
                                        // MARK: Getting Balances With Drag Gesture
                                        // Get Drag Location
                                        let location = value.location
                                        // Capture Date From Chart With Dragged Location
                                        if let date: Date = proxy.value(atX: location.x) {
                                            let calendar = Calendar.current
                                            let day = calendar.component(.day, from: date)
                                            let month = calendar.component(.month, from: date)
                                            let year = calendar.component(.year, from: date)
                                            // Find Item Which Date's Day Is The Same As Captured Date From Location
                                            if let currentItem = sortedBalances.first(where: { item in
                                                calendar.component(.day, from: item.date) == day &&
                                                calendar.component(.month, from: item.date) == month &&
                                                calendar.component(.year, from: item.date) == year
                                            }) {
                                                homeViewModel.currentChosenBalanceHistory = currentItem
                                                print(currentItem.balance)
                                                print(currentItem.date)
                                                homeViewModel.plotWidth = proxy.plotSize.width
                                            }
                                        }
                                    }
                                    .onEnded { value in
                                        homeViewModel.currentChosenBalanceHistory = nil
                                    }
                            )
                        
                    }
                }
                .chartYScale(domain: (homeViewModel.getMin(from: sortedBalances) - Double(400))...(homeViewModel.getMax(from: sortedBalances) + Double(100)))
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

#Preview {
    HomeView(homeViewModel: HomeViewModel())
        .environmentObject(UserManager())
        .environmentObject(LinkedAccountsManager())
}
