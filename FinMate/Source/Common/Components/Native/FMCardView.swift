//
//  FMCardView.swift
//  FinMate
//
//  Created by Temur Chitashvili on 08.11.24.
//

import SwiftUI

/// A customizable card view that can display content with optional styling.
///
/// This view renders a rounded rectangle with customizable properties such as foreground color,
/// shadow, corner radius, and an optional border. It is flexible enough to fit various design needs.
struct FMCardView: View {
    
    // MARK: - Properties
    
    /// The foreground color of the card.
    let foregroundColor: Color
    
    /// The corner radius for rounding the card's corners.
    let cornerRadius: CGFloat
    
    /// The color of the shadow applied to the card.
    let shadowColor: Color
    
    /// The radius of the shadow, determining how blurred the shadow appears.
    let shadowRadius: CGFloat
    
    /// The alignment for positioning the content within the card.
    let contentAlignment: Alignment
    
    /// The optional stroke color for the card's border.
    /// If `nil`, no border will be drawn.
    let strokeColor: Color?
    
    /// The optional stroke width for the card's border.
    /// If `nil`, the default width is zero.
    let strokeWidth: CGFloat?
    
    // MARK: - Body
    
    /// The main view for rendering the card with all specified styles.
    ///
    /// - The card is created using a `RoundedRectangle` shape with customizable styles.
    /// - If a `strokeColor` and `strokeWidth` are provided, a border is added.
    var body: some View {
        RoundedRectangle(cornerRadius: cornerRadius)
            // Apply the foreground color to the card.
            .foregroundStyle(foregroundColor)
            
            // Add a shadow with the specified color and radius.
            .shadow(color: shadowColor, radius: shadowRadius)
            
            // Conditionally apply a border if both strokeColor and strokeWidth are non-nil.
            .overlay(
                (strokeColor != nil && strokeWidth != nil) ?
                RoundedRectangle(cornerRadius: cornerRadius)
                    .stroke(strokeColor!, lineWidth: strokeWidth!)
                : nil
            )
    }
}
