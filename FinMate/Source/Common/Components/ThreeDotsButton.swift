//
//  ThreeDotsButton.swift
//  FinMate
//
//  Created by Temur Chitashvili on 09.11.24.
//

import SwiftUI

/// A customizable button view that displays a three-dots icon.
///
/// This button uses the system icon `ellipsis.circle.fill` and allows for setting a custom color and action.
struct ThreeDotsButton: View {
    
    // MARK: - Properties
    
    /// The color of the button's icon.
    let color: Color
    
    /// The action to be performed when the button is tapped.
    let action: () -> Void
    
    // MARK: - Initializer
    
    /// Initializes a new `ThreeDotsButton` with a specified color and action.
    ///
    /// - Parameters:
    ///   - color: The color of the button's icon.
    ///   - action: A closure to execute when the button is tapped.
    init(
        color: Color,
        action: @escaping () -> Void
    ) {
        self.action = action
        self.color = color
    }
    
    // MARK: - Body
    
    /// The main view that renders the button.
    ///
    /// - Displays a button with a three-dots icon. When tapped, the specified action is triggered.
    var body: some View {
        Button {
            // Perform the action when the button is pressed.
            action()
        } label: {
            // Display a filled circle with an ellipsis icon.
            Image(systemName: "ellipsis.circle.fill")
                .foregroundStyle(color)
        }
    }
}
