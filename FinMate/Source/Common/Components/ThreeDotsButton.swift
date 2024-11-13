//
//  ThreeDotsButton.swift
//  FinMate
//
//  Created by Temur Chitashvili on 09.11.24.
//

import SwiftUI

struct ThreeDotsButton: View {
    let color: Color
    let action: () -> Void
    
    init(
        color: Color,
        action: @escaping () -> Void
    ) {
        self.action = action
        self.color = color
    }
    
    var body: some View {
        Button {
            action()
        } label: {
            Image(systemName: "ellipsis.circle.fill")
                .foregroundStyle(color)
        }
    }
}
