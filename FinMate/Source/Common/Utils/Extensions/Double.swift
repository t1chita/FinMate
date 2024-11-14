//
//  Double.swift
//  FinMate
//
//  Created by Temur Chitashvili on 09.11.24.
//

import Foundation

/// An extension to the `Double` type to format numeric values into string representations with
/// thousands (K) and millions (M) suffixes for easier readability.
extension Double {
    
    /// A computed property that formats a `Double` into a string representation.
    /// - For values greater than or equal to 10,000 and less than 1,000,000, it converts the value
    ///   into a string with a "K" suffix (for thousands).
    /// - For values greater than 1,000,000, it converts the value into a string with an "M" suffix
    ///   (for millions).
    /// - For other values, it returns the number as an integer string.
    /// - Removes any unnecessary ".0" from the string if the number is a round value (e.g., 10K, 1M).
    var stringFormat: String {
        // Format numbers greater than or equal to 10,000 but less than 1,000,000 as "K" (thousands)
        if self >= 10000 && self < 999999 {
            return String(format: "%.1fK", self / 1000).replacingOccurrences(of: ".0", with: "")
        }

        // Format numbers greater than 1,000,000 as "M" (millions)
        if self > 999999 {
            return String(format: "%.1fM", self / 1000000).replacingOccurrences(of: ".0", with: "")
        }
        
        // Return the number as an integer string if it's not in the "K" or "M" range
        return String(format: "%.0f", self)
    }
}
