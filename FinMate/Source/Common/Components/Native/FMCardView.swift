//
//  FNCardView.swift
//  FinMate
//
//  Created by Temur Chitashvili on 08.11.24.
//
import SwiftUI

/// A customizable card view that can display content with optional styling.
///
/// This view displays a rounded rectangle with a specified foreground color, shadow, and optional stroke.
/// The content of the card can be provided as a closure, allowing for dynamic views to be embedded.
struct FMCardView: View {
    /// The foreground color of the card.
    let foregroundColor: Color
    
    /// The corner radius for rounding the card's corners.
    let cornerRadius: CGFloat
    
    /// The color of the shadow.
    let shadowColor: Color
    
    /// The radius of the shadow.
    let shadowRadius: CGFloat
    
    /// The alignment for positioning the content within the card.
    let contentAlignment: Alignment
    
    /// The optional stroke color for the card's border.
    let strokeColor: Color?
    
    /// The optional stroke width for the card's border.
    let strokeWidth: CGFloat?
    
    var body: some View {
        RoundedRectangle(cornerRadius: cornerRadius)
            .foregroundStyle(foregroundColor)
            .shadow(color: shadowColor, radius: shadowRadius)
            .overlay(
                // Apply stroke if strokeColor and strokeWidth are provided.
                (strokeColor != nil && strokeWidth != nil) ?
                RoundedRectangle(cornerRadius: cornerRadius).stroke(strokeColor!, lineWidth: strokeWidth!) : nil
            )
        
    }
}
