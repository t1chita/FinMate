//
//  NotificationSetting.swift
//  FinMate
//
//  Created by Temur Chitashvili on 07.11.24.
//


import Foundation

struct NotificationSetting: Identifiable {
    let id: UUID
    var title: String
    var isEnabled: Bool
    var type: NotificationType
    var triggerDate: Date?
    
    init(id: UUID = UUID(), title: String, isEnabled: Bool = true, type: NotificationType, triggerDate: Date? = nil) {
        self.id = id
        self.title = title
        self.isEnabled = isEnabled
        self.type = type
        self.triggerDate = triggerDate
    }
}

enum NotificationType: String {
    case budgetLimitReached
    case goalReminder
    case newTransaction
}
