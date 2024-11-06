//
//  AppConstants.swift
//  FinMate
//
//  Created by Temur Chitashvili on 05.11.24.
//

import Foundation

struct AppConstants {
    public enum CornerRadius {
        // Apple's HIG often recommends using standard corner radius values, like 8 or 12, for common UI elements.
        static let small: CGFloat = 4       // Small corner radius for icons or small elements
        static let medium: CGFloat = 8      // Medium for buttons or cards
        static let large: CGFloat = 12      // Large for modals or prominent elements
        static let extraLarge: CGFloat = 16 // Extra large for larger, rounded containers
    }
    
    public enum Paddings {
        // Padding values based on common HIG spacing guidelines.
        static let tiny: CGFloat = 4        // Small padding for tight spaces
        static let small: CGFloat = 8       // Small padding for compact spacing
        static let medium: CGFloat = 16     // Medium padding for general spacing between elements
        static let large: CGFloat = 24      // Large padding for more separation
        static let extraLarge: CGFloat = 32 // Extra large padding for spacious layouts
    }
}

