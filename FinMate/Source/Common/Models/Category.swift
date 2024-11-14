//
//  Category.swift
//  FinMate
//
//  Created by Temur Chitashvili on 07.11.24.
//

import Foundation

/// A struct representing a transaction category used for organizing expenses or income.
///
/// Each category has a unique identifier, a name, an optional icon, and a color for display.
/// Categories can either be predefined by the app or user-defined for customization.
struct Category: Identifiable {
    
    /// Unique identifier for the category.
    let id: UUID
    
    /// The name of the category (e.g., "Food", "Transportation").
    var name: String
    
    /// An optional icon representing the category.
    /// This could be an emoji or the name of a system image.
    var icon: String?
    
    /// The color code for the category represented as a hex string (e.g., "#FF5733").
    var colorCode: String
    
    /// Indicates whether the category was defined by the user (`true`) or is a default category (`false`).
    var isUserDefined: Bool
    
    /// Initializes a new `Category` with the specified properties.
    ///
    /// - Parameters:
    ///   - id: A unique identifier for the category (default is a new UUID).
    ///   - name: The name of the category.
    ///   - icon: An optional icon representing the category (default is `nil`).
    ///   - colorCode: The hex code representing the category color (default is white "#FFFFFF").
    ///   - isUserDefined: A flag indicating if the category is user-defined (default is `false`).
    init(
        id: UUID = UUID(),
        name: String,
        icon: String? = nil,
        colorCode: String = "#FFFFFF",
        isUserDefined: Bool = false
    ) {
        self.id = id
        self.name = name
        self.icon = icon
        self.colorCode = colorCode
        self.isUserDefined = isUserDefined
    }
}
