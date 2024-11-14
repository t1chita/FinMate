//
//  UserDefaults.swift
//  FinMate
//
//  Created by Temur Chitashvili on 05.11.24.
//

import Foundation

// MARK: - UserDefaults Keys
// This section defines keys used for storing and retrieving data from UserDefaults.
// These keys are grouped into two categories: OnBoardingKeys and AppSettingsKeys.

extension UserDefaults {
    
    /// Contains keys related to user onboarding preferences.
    struct OnBoardingKeys {
        // A key used to track if the user is logging in for the first time.
        static let USER_FIRST_LOGGED_IN = "USER_FIRST_LOGGED_IN"
    }
    
    /// Contains keys related to the app settings.
    struct AppSettingsKeys {
        // A key used to store the selected app language.
        static let APP_LANGUAGE = "APP_LANGUAGE"
    }
}

// MARK: - AppSettingsKeys
// This section handles the app settings, such as the language preference.

extension UserDefaults {
    /// Computed property to get and set the app language.
    /// - Retrieves the app language stored in UserDefaults.
    /// - Sets a new app language value to UserDefaults.
    static var appLanguage: String? {
        get {
            // Get the app language from UserDefaults using the defined key.
            UserDefaults.standard.string(forKey: AppSettingsKeys.APP_LANGUAGE)
        } set {
            // Set the app language value to UserDefaults using the defined key.
            UserDefaults.standard.set(newValue, forKey: AppSettingsKeys.APP_LANGUAGE)
        }
    }
}

// MARK: - OnBoardingKeys
// This section handles the user's first login status.

extension UserDefaults {
    /// Computed property to get and set whether the user is logged in for the first time.
    /// - Retrieves the status of the user's first login from UserDefaults.
    /// - Sets a new value indicating whether it's the user's first login.
    static var isUserLoggedIn: Bool {
        get {
            // Get the first login status from UserDefaults using the defined key.
            UserDefaults.standard.bool(forKey: OnBoardingKeys.USER_FIRST_LOGGED_IN)
        } set {
            // Set the first login status to UserDefaults using the defined key.
            UserDefaults.standard.set(newValue, forKey: OnBoardingKeys.USER_FIRST_LOGGED_IN)
        }
    }
}
