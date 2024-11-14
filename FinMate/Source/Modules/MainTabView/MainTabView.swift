//
//  MainTabView.swift
//  FinMate
//
//  Created by Temur Chitashvili on 06.11.24.
//

import SwiftUI

struct MainTabView: View {
    
    init() {
        UITabBar.appearance().backgroundColor = UIColor.primaryText // Set the background color of the tab bar.
    }
    
    var body: some View {
        TabView {
            HomeView(homeViewModel: HomeViewModel())
            .tabItem {
                    VStack {
                        Image(.home)
                        
                        Text("Home")
                    }
                }
            Text("Transactions")
                .tabItem {
                    VStack {
                        Image(.transactions)
                        
                        Text("Transactions")
                    }
                }
            
            Text("Budget")
                .tabItem {
                    VStack {
                        Image(.budget)
                            
                        
                        Text("Budget")
                    }
                }
            
            Text("Goals")
                .tabItem {
                    VStack {
                        Image(.goal)
                        
                        Text("Goals")
                    }
                }
            
            Text("Settings")
                .tabItem {
                    VStack {
                        Image(.settings)
                        
                        Text("Settings")
                    }
                }
        }
        .accentColor(.blue)
        .toolbarBackground(.primaryText, for: .tabBar)
    }
}
 
