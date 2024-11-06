//
//  UserDefaults.swift
//  FinMate
//
//  Created by Temur Chitashvili on 05.11.24.
//


import Foundation

extension UserDefaults {
    struct OnBoardingKeys {
        static let USER_FIRST_LOGGED_IN = "USER_FIRST_LOGGED_IN"
    }
    
    struct AppSettingsKeys {
        static let APP_LANGUAGE = "APP_LANGUAGE"
    }
}

//MARK: - AppSettingsKeys
extension UserDefaults {
    static var appLanguage: String? {
        get {
            UserDefaults.standard.string(forKey: AppSettingsKeys.APP_LANGUAGE)
        } set {
            UserDefaults.standard.set(newValue, forKey: AppSettingsKeys.APP_LANGUAGE)
        }
    }
}

//MARK: - OnBoardingKeys
extension UserDefaults {
    static var isUserLoggedIn: Bool {
        get {
            UserDefaults.standard.bool(forKey: OnBoardingKeys.USER_FIRST_LOGGED_IN)
        } set {
            UserDefaults.standard.set(newValue, forKey: OnBoardingKeys.USER_FIRST_LOGGED_IN)
        }
    }
}
