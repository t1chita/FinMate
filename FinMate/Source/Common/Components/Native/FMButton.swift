//
//  FMButton.swift
//  FinMate
//
//  Created by Temur Chitashvili on 07.11.24.
//

import SwiftUI


/// A customizable button that uses the CRCardView for its appearance.
///
/// This button allows you to specify its appearance and action when tapped.
struct FMButton<Content: View>: View {
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
    let strokeColor: Color?
    
    /// The optional stroke width for the button's border.
    let strokeWidth: CGFloat?
    
    /// The content view to display inside the button.
    let content: () -> Content
    
    var body: some View {
        Button(action: action) {
            content()
                .background(
                    FMCardView(
                    foregroundColor: foregroundColor,
                    cornerRadius: cornerRadius,
                    shadowColor: shadowColor,
                    shadowRadius: shadowRadius,
                    contentAlignment: contentAlignment,
                    strokeColor: strokeColor,
                    strokeWidth: strokeWidth)
                )
        }
    }
}
