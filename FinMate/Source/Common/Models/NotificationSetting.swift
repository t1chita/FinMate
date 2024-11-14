//
//  NotificationSetting.swift
//  FinMate
//
//  Created by Temur Chitashvili on 07.11.24.
//

import Foundation

/// A model representing the notification settings for the user.
///
/// This struct is used to define the properties of a notification setting
/// including its title, whether it is enabled or not, the type of notification,
/// and an optional trigger date for when the notification should be sent.
struct NotificationSetting: Identifiable {
    
    /// Unique identifier for the notification setting.
    let id: UUID
    
    /// The title of the notification, such as "Budget Limit Reached" or "Goal Reminder".
    var title: String
    
    /// A flag indicating whether this notification is enabled or disabled.
    /// Defaults to `true` (enabled).
    var isEnabled: Bool
    
    /// The type of notification, defined by the `NotificationType` enum.
    var type: NotificationType
    
    /// The date and time when the notification should be triggered.
    /// This is optional and can be `nil` if no specific trigger date is set.
    var triggerDate: Date?
    
    /// Initializes a new `NotificationSetting` object with the specified parameters.
    ///
    /// - Parameters:
    ///   - id: The unique identifier for the notification setting. Defaults to a new `UUID`.
    ///   - title: The title of the notification.
    ///   - isEnabled: A flag indicating whether the notification is enabled. Defaults to `true`.
    ///   - type: The type of the notification (e.g., budget limit, goal reminder, etc.).
    ///   - triggerDate: The optional date for triggering the notification.
    init(
        id: UUID = UUID(),
        title: String,
        isEnabled: Bool = true,
        type: NotificationType,
        triggerDate: Date? = nil
    ) {
        self.id = id
        self.title = title
        self.isEnabled = isEnabled
        self.type = type
        self.triggerDate = triggerDate
    }
}

/// Enumeration defining the different types of notifications that can be configured.
///
/// Each case represents a specific type of notification the user can set up.
enum NotificationType: String {
    case budgetLimitReached   // Notification triggered when the budget limit is reached.
    case goalReminder         // Reminder for an ongoing financial goal.
    case newTransaction       // Notification when a new transaction occurs.
}
