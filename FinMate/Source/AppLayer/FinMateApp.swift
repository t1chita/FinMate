//
//  FinMateApp.swift
//  FinMate
//
//  Created by Temur Chitashvili on 06.11.24.
//

import SwiftUI

@main
struct FinMateApp: App {
    @StateObject var userManager: UserManager = UserManager()
    @StateObject var linkedAccountsManager: LinkedAccountsManager = LinkedAccountsManager()
    var body: some Scene {
        WindowGroup {
            MainTabView()
                .environmentObject(userManager)
                .environmentObject(linkedAccountsManager)
        }
    }
}
