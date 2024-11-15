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
 
    var body: some View {
        ZStack {
            // Background Color
            Color.white
                .ignoresSafeArea()
            
            VStack {
                greetingText
                
                cardsView
                
                widgetsOfUser
                
                Spacer()
            }
            .padding(.horizontal, AppConstants.Paddings.medium)
            .padding(.top, AppConstants.Paddings.medium)
        }
    }
    
    private var greetingText: some View {
        HStack {
            FMText(
                content: "Hello,",
                font: .title,
                color: .primaryDarkText,
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
    
    private var widgetsOfUser: some View {
        ScrollView {
            VStack {
                balanceTrendCardHeader
                
                Divider()
                    .padding(.horizontal, -16)
                
                chartForBalanceTrendCard
                
                HStack {
                    Spacer()
                    
                    FMText(
                        content: "See More",
                        font: .caption,
                        color: .fmAccent,
                        fontWeight: .regular
                    )
                    .underline()
                }
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
            
            lastFiveTransactionView
            
            pieChart
        }
        .scrollIndicators(.hidden)
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
                
                ThreeDotsButton(color: .primaryDarkText) {
                    print("ThreeDot")
                }
            }
            
            FMText(
                content: userManager.user.balance.stringFormat + " " + userManager.user.currency,
                font: .title3,
                color: .primaryDarkText,
                fontWeight: .bold
            )
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
    
    private var lastFiveTransactionView: some View {
        VStack(spacing: AppConstants.Paddings.large) {
            HStack {
                FMText(
                    content: "Last 5 Transaction",
                    font: .body,
                    color: .primaryDarkText,
                    fontWeight: .bold
                )
                
                Spacer()
                
                ThreeDotsButton(color: .primaryDarkText) {
                    print("ThreeDot")
                }
            }
            
            if userManager.user.transactions.isEmpty {
                noTransactionView
            } else {
                transactionCell

                HStack {
                    Spacer()
                    
                    FMText(
                        content: "See More",
                        font: .caption,
                        color: .fmAccentLighter,
                        fontWeight: .regular
                    )
                    .underline()
                }
            }
        }
        .padding(AppConstants.Paddings.medium)
        .background(
            FMCardView(
                foregroundColor: .clear,
                cornerRadius: AppConstants.CornerRadius.medium,
                shadowColor: .clear,
                shadowRadius: 0,
                contentAlignment: .center,
                strokeColor: .secondaryText,
                strokeWidth: 1
            )
        )
    }
    
    private var noTransactionView: some View {
    VStack(spacing: AppConstants.Paddings.medium)  {
        FMText(
            content: "You Have Not Any Transaction",
            font: .body,
            color: .primaryDarkText,
            alignment: .center,
            fontWeight: .bold
        )
        
        VStack(spacing: AppConstants.Paddings.small) {
            Image(.plus)
            
            FMText(
                content: "Add Transaction",
                font: .body,
                color: .tertiaryText,
                fontWeight: .regular
            )
        }
    }
}
    
    private var transactionCell: some View {
        ForEach(userManager.user.transactions) { transaction in
            HStack {
                FMText(
                    content: "\(transaction.emoji)",
                    font: .body,
                    color: .white,
                    fontWeight: .regular
                )
                .padding(AppConstants.Paddings.tiny)
                .background(
                    FMCardView(
                        foregroundColor: Color(transaction.backgroundColor),
                        cornerRadius: AppConstants.CornerRadius.small,
                        shadowColor: .clear,
                        shadowRadius: 0,
                        contentAlignment: .center,
                        strokeColor: nil,
                        strokeWidth: nil
                    )
                )
                
                VStackLayout(alignment: .leading) {
                    FMText(content: transaction.category.rawValue.uppercased(),
                           font: .callout,
                           color: .primaryDarkText,
                           fontWeight: .bold)
                    
                    FMText(content: homeViewModel.getAccount(with: transaction.accountId,
                                                             in: userManager.user.linkedAccounts).accountName,
                           font: .body,
                           color: .secondaryText,
                           fontWeight: .bold)
                }
                
                Spacer()
                
                VStack(alignment: .trailing) {
                    FMText(
                        content: transaction.amount.stringFormat + " " + userManager.user.currency,
                        font: .caption,
                        color: transaction.transactionType == .expense ? .red4 : .green5,
                        fontWeight: .regular
                    )
                    
                    FMText(
                        content: transaction.date.formatted(),
                        font: .caption,
                        color: transaction.transactionType == .expense ? .red4 : .green5,
                        fontWeight: .regular
                    )
                }
            }
            .padding(AppConstants.Paddings.small)
            .background(
                FMCardView(
                    foregroundColor: .clear,
                    cornerRadius: AppConstants.CornerRadius.small,
                    shadowColor: .clear,
                    shadowRadius: 0,
                    contentAlignment: .center,
                    strokeColor: transaction.transactionType == .expense ? .red4 : .green5,
                    strokeWidth: 2
                )
            )
        }
    }
    
    private var pieChart: some View {
        Group {
            if !userManager.user.transactions.isEmpty {
                VStack {
                    HStack {
                        FMText(
                            content: "Expenses And Income",
                            font: .body,
                            color: .primaryDarkText,
                            fontWeight: .bold
                        )

                        Spacer()
                    }
                    categoriesPicker
                    
                    // Pie Chart
                    Chart(homeViewModel.getTransactionsReadyForPieChart(userManager.user.transactions)) { data in
                        SectorMark(
                            angle: .value("Amount", data.totalAmount),
                            innerRadius: .ratio(0.5)
                        )
                        .foregroundStyle(by: .value("Category", data.category.rawValue.uppercased()))
                    }
                    .frame(height: 200)
                    
                    // Bar Chart
                    Chart(homeViewModel.getTransactionsReadyForPieChart(userManager.user.transactions)) { data in
                        BarMark(
                            x: .value("Amount", data.totalAmount),
                            y: .value("Category", data.category.rawValue.uppercased())
                        )
                        .foregroundStyle(by: .value("Category", data.category.rawValue.uppercased()))
                        .cornerRadius(5)
                    }
                    .frame(height: 150)
                }
            } else {
                noCategoryView
            }
        }
            .padding(AppConstants.Paddings.medium)
            .background(
                FMCardView(
                    foregroundColor: .clear,
                    cornerRadius: AppConstants.CornerRadius.large,
                    shadowColor: .clear,
                    shadowRadius: 0,
                    contentAlignment: .center,
                    strokeColor: nil,
                    strokeWidth: nil
                )
            )
    }
    
    private var categoriesPicker: some View {
        Picker("", selection: $homeViewModel.categoriesChart) {
            Text("Expanded")
                .tag("Expanded")
            
            Text("Income")
                .tag("Income")
        }
        .pickerStyle(SegmentedPickerStyle())
    }
    
    private var noCategoryView: some View {
        VStack(spacing: AppConstants.Paddings.medium)  {
            HStack {
                FMText(
                    content: "Expenses And Income",
                    font: .body,
                    color: .primaryDarkText,
                    fontWeight: .bold
                )

                Spacer()
                
                ThreeDotsButton(color: .primaryDarkText) {
                        print("Expenses And Income")
                    }
            }
            
            FMText(
                content: "We Can't Track Your Expanses And Income",
                font: .body,
                color: .primaryDarkText,
                alignment: .center,
                fontWeight: .bold
            )
            
            VStack(spacing: AppConstants.Paddings.small) {
                Image(.plus)
                
                FMText(
                    content: "Add Transactions",
                    font: .body,
                    color: .primaryDarkText,
                    fontWeight: .regular
                )
            }
        }
        .frame(maxWidth: .infinity)
    }
}

#Preview {
    HomeView(homeViewModel: HomeViewModel())
        .environmentObject(UserManager())
        .environmentObject(LinkedAccountsManager())
}
