//
//  FMText.swift
//  FinMate
//
//  Created by Temur Chitashvili on 05.11.24.
//

import SwiftUI

/// A customizable text view that allows for various styling options.
///
/// This view provides a simple and flexible way to display text with customizable properties
/// such as font, color, alignment, line limit, and font weight.
struct FMText: View {
    
    // MARK: - Properties
    
    /// The text to be displayed.
    let content: String
    
    /// The font of the text.
    let font: Font
    
    /// The color of the text.
    let color: Color
    
    /// The alignment of the text.
    let alignment: TextAlignment
    
    /// The maximum number of lines to display.
    /// If `nil`, the text can use unlimited lines.
    let lineLimit: Int?
    
    /// The weight of the text font (e.g., regular, bold).
    let fontWeight: Font.Weight
    
    // MARK: - Initializer
    
    /// Initializes a new `FMText` view with the specified properties.
    ///
    /// - Parameters:
    ///   - content: The text content to display.
    ///   - font: The font style of the text. Defaults to `.body`.
    ///   - color: The color of the text. Defaults to `.primary`.
    ///   - alignment: The alignment of the text. Defaults to `.leading`.
    ///   - lineLimit: The maximum number of lines to display. Defaults to `nil` (no limit).
    ///   - fontWeight: The font weight. Defaults to `.regular`.
    init(
        content: String,
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
    
    // MARK: - Body
    
    /// The main view for rendering the text with the specified styles.
    ///
    /// - Displays the text with the configured font, color, alignment, line limit, and weight.
    var body: some View {
        Text(content)
            // Apply the specified font style.
            .font(font)
            
            // Set the font weight.
            .fontWeight(fontWeight)
            
            // Apply the specified text color.
            .foregroundColor(color)
            
            // Set the alignment for multiple lines of text.
            .multilineTextAlignment(alignment)
            
            // Limit the number of lines if `lineLimit` is provided.
            .lineLimit(lineLimit)
    }
}
