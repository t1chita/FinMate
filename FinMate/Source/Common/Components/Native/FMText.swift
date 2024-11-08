//
//  FMText.swift
//  FinMate
//
//  Created by Temur Chitashvili on 05.11.24.
//

import SwiftUI

/// A customizable text view that allows for various styling options.
///
/// This view provides a simple way to display text with customizable properties
/// such as font, color, alignment, and line limit.
struct FMText: View {
    /// The text to be displayed.
    let content: String
    
    /// The font of the text.
    let font: Font
    
    /// The color of the text.
    let color: Color
    
    /// The alignment of the text.
    let alignment: TextAlignment
    
    /// The maximum number of lines to display.
    let lineLimit: Int?
    
    let fontWeight: Font.Weight
    
    /// Initializes a new `CRText` view with the specified properties.
    /// - Parameters:
    ///   - content: The text content to display.
    ///   - font: The font of the text.
    ///   - color: The color of the text.
    ///   - alignment: The alignment of the text.
    ///   - lineLimit: The maximum number of lines to display.
    init(content: String,
         font: Font = .body,
         color: Color = .primary,
         alignment: TextAlignment = .leading,
         lineLimit: Int? = nil,
         fontWeight: Font.Weight = .regular
    ) {
        self.content = content
        self.font = font
        self.color = color
        self.alignment = alignment
        self.lineLimit = lineLimit
        self.fontWeight = fontWeight
    }
    
    var body: some View {
        Text(content)
            .font(font)
            .fontWeight(fontWeight)
            .foregroundColor(color)
            .multilineTextAlignment(alignment)
            .lineLimit(lineLimit)
    }
}
