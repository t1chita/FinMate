//
//  HeightWidthModifiers.swift
//  FinMate
//
//  Created by Temur Chitashvili on 08.11.24.
//

import SwiftUI

/// A custom view modifier to get the height of a view.
struct GetHeightModifier: ViewModifier {
    // A binding to a CGFloat that will hold the height value of the view
    @Binding var height: CGFloat

    // The body of the view modifier, which defines how the content should be modified
    func body(content: Content) -> some View {
        content
            // Using GeometryReader to get the size of the view
            .background(
                GeometryReader { geo -> Color in
                    // Capture the height of the view once it's available and update the bound height property
                    DispatchQueue.main.async {
                        height = geo.size.height
                    }
                    // Return a clear color, as the background color is not the focus
                    return Color.clear
                }
            )
    }
}

/// A custom view modifier to get the width of a view.
struct GetWidthModifier: ViewModifier {
    // A binding to a CGFloat that will hold the width value of the view
    @Binding var width: CGFloat

    // The body of the view modifier, which defines how the content should be modified
    func body(content: Content) -> some View {
        content
            // Using GeometryReader to get the size of the view
            .background(
                GeometryReader { geo -> Color in
                    // Capture the width of the view once it's available and update the bound width property
                    DispatchQueue.main.async {
                        width = geo.size.width
                    }
                    // Return a clear color, as the background color is not the focus
                    return Color.clear
                }
            )
    }
}
