//
//  AppConstants.swift
//  FinMate
//
//  Created by Temur Chitashvili on 05.11.24.
//

import Foundation

/// A collection of constants used throughout the FinMate app.
///
/// This struct organizes reusable values such as corner radii and paddings for consistent design across the app.
struct AppConstants {
    
    // MARK: - Corner Radius
    
    /// Predefined corner radius values for consistent use throughout the app.
    ///
    /// These values align with Apple's Human Interface Guidelines (HIG) for common UI elements.
    public enum CornerRadius {
        /// Small corner radius for icons or compact UI elements.
        static let small: CGFloat = 4
        
        /// Medium corner radius, commonly used for buttons or card views.
        static let medium: CGFloat = 8
        
        /// Large corner radius, suitable for modals or prominent elements.
        static let large: CGFloat = 12
        
        /// Extra large corner radius for larger, rounded containers.
        static let extraLarge: CGFloat = 16
    }
    
    // MARK: - Paddings
    
    /// Predefined padding values to maintain consistent spacing throughout the app.
    ///
    /// These padding values are inspired by Apple's HIG spacing recommendations.
    public enum Paddings {
        /// Tiny padding for tight spaces, like between closely packed elements.
        static let tiny: CGFloat = 4
        
        /// Small padding for compact spacing, used in smaller UI components.
        static let small: CGFloat = 8
        
        /// Medium padding for standard spacing between elements.
        static let medium: CGFloat = 16
        
        /// Large padding for increased separation between sections or components.
        static let large: CGFloat = 24
        
        /// Extra large padding for spacious layouts, often used in larger sections.
        static let extraLarge: CGFloat = 32
    }
}
