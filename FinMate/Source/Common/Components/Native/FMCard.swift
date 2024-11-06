//
//  FMCard.swift
//  FinMate
//
//  Created by Temur Chitashvili on 05.11.24.
//


import SwiftUI

struct FMCard<Content: View>: View {
    let style: FMCardStyleType
    let content: Content

    init(style: FMCardStyleType, @ViewBuilder content: () -> Content) {
        self.style = style
        self.content = content()
    }

    var body: some View {
        VStack {
            content
                .padding()
                .frame(maxWidth: .infinity)
                .background(backgroundView)  // Use a view instead of a color here
                .clipShape(RoundedRectangle(cornerRadius: 12))
                .overlay(
                    RoundedRectangle(cornerRadius: 12)
                        .stroke(style == .outline ? Color.gray : Color.clear, lineWidth: 1)
                )
                .shadow(radius: style == .filled ? 4 : 0)
        }
    }

    @ViewBuilder
    private var backgroundView: some View {
        switch style {
        case .filled:
            Color.fmCard
        case .outline:
            Color.clear
        case .gradient:
            LinearGradient(colors: [Color.blue1, Color.blue3, Color.blue5, Color.blue7, Color.blue9], startPoint: .top, endPoint: .bottom)
        }
    }
}

