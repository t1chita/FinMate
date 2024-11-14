//
//  FMButton.swift
//  FinMate
//
//  Created by Temur Chitashvili on 07.11.24.
//

import SwiftUI

/// A customizable button that uses the `FMCardView` for its appearance.
///
/// This button provides flexibility in its design, allowing the user to specify colors,
/// corner radius, shadows, alignment, and an optional border.
///
/// - Note: The button's appearance is customized using the `FMCardView` as its background.
struct FMButton<Content: View>: View {
    
    // MARK: - Properties
    
    /// The action to perform when the button is tapped.
    let action: () -> Void
    
    /// The foreground color of the button.
    let foregroundColor: Color
    
    /// The corner radius of the button.
    let cornerRadius: CGFloat
    
    /// The shadow color of the button.
    let shadowColor: Color
    
    /// The shadow radius of the button.
    let shadowRadius: CGFloat
    
    /// The alignment for positioning the content within the button.
    let contentAlignment: Alignment
    
    /// The optional stroke color for the button's border.
    /// If `nil`, no border will be applied.
    let strokeColor: Color?
    
    /// The optional stroke width for the button's border.
    /// If `nil`, the default border width is zero.
    let strokeWidth: CGFloat?
    
    /// The content view to display inside the button.
    let content: () -> Content
    
    // MARK: - Body
    
    /// The main view of the button.
    ///
    /// This view uses a `Button` with custom content and a background defined by the `FMCardView`.
    var body: some View {
        Button(action: action) {
            // Display the button's content provided by the user.
            content()
                .background(
                    // Apply the custom card view as the background.
                    FMCardView(
                        foregroundColor: foregroundColor,
                        cornerRadius: cornerRadius,
                        shadowColor: shadowColor,
                        shadowRadius: shadowRadius,
                        contentAlignment: contentAlignment,
                        strokeColor: strokeColor,
                        strokeWidth: strokeWidth
                    )
                )
        }
    }
}
