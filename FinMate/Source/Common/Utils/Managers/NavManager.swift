//
//  NavManager.swift
//  FinMate
//
//  Created by Temur Chitashvili on 05.11.24.
//

import SwiftUI

/// `NavigationManager` is responsible for managing the navigation state within the app.
/// It controls navigation using a `NavigationPath` and allows navigation to different destinations,
/// as well as navigation control features like navigating back, to the root, or with steps.
final class NavigationManager: ObservableObject {
    
    // MARK: - Destination Enum
    /// Enum to represent different navigation destinations in the app.
    /// Each destination case represents a screen or view in the navigation stack.
    public enum Destination: Codable, Hashable {
        // The main tab view destination, used as the starting point of the app.
        case mainTabView
    }
    
    // MARK: - Properties
    /// The navigation path that tracks the stack of views in the app.
    /// It is an observable property, so when it's updated, the view will reactively update.
    @Published var navPath = NavigationPath()
    
    // MARK: - Navigation Functions
    
    /// Navigates to a specific destination by appending it to the navigation path.
    /// - Parameter destination: The destination to navigate to.
    func navigate(to destination: Destination) {
        // Append the destination to the navigation path, updating the stack.
        navPath.append(destination)
    }
    
    /// Navigates back by removing the last destination in the navigation stack.
    /// This function pops the top view off the navigation stack.
    func navigateBack() {
        // Remove the last item from the navigation path, effectively going back one step.
        navPath.removeLast()
    }
    
    /// Navigates to the root view by clearing the entire navigation stack.
    func navigateToRoot() {
        // Remove all elements from the navigation path, going back to the root view.
        navPath.removeLast(navPath.count)
    }
    
    /// Navigates back by a specified number of steps.
    /// - Parameter steps: The number of steps to go back in the navigation stack.
    func navigateBackWithSteps(_ steps: Int) {
        // Only proceed if the number of steps is greater than 0.
        guard steps > 0 else { return }
        
        // Calculate the number of steps to remove, ensuring it's within the bounds of the navigation stack.
        let countToRemove = min(steps, navPath.count)
        
        // Remove the specified number of steps from the navigation stack.
        for _ in 0..<countToRemove {
            navPath.removeLast()
        }
    }
}
