//
//  Category.swift
//  FinMate
//
//  Created by Temur Chitashvili on 07.11.24.
//


import Foundation

struct Category: Identifiable {
    let id: UUID
    var name: String
    var icon: String?  // Using emoji or icon name for display
    var colorCode: String // Hex code for color
    var isUserDefined: Bool
    
    init(id: UUID = UUID(), name: String, icon: String? = nil, colorCode: String = "#FFFFFF", isUserDefined: Bool = false) {
        self.id = id
        self.name = name
        self.icon = icon
        self.colorCode = colorCode
        self.isUserDefined = isUserDefined
    }
}
