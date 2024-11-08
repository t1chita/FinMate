//
//  HeightWidthModifiers.swift
//  FinMate
//
//  Created by Temur Chitashvili on 08.11.24.
//


import SwiftUI

struct GetHeightModifier: ViewModifier {
    @Binding var height: CGFloat

    func body(content: Content) -> some View {
        content.background(
            GeometryReader { geo -> Color in
                DispatchQueue.main.async {
                    height = geo.size.height
                }
                return Color.clear
            }
        )
    }
}

struct GetWidthModifier: ViewModifier {
    @Binding var width: CGFloat

    func body(content: Content) -> some View {
        content.background(
            GeometryReader { geo -> Color in
                DispatchQueue.main.async {
                    width = geo.size.width
                }
                return Color.clear
            }
        )
    }
}
