//
//  FMButton.swift
//  FinMate
//
//  Created by Temur Chitashvili on 07.11.24.
//

import SwiftUI

struct FMButton: View {
    let title: String
    let icon: Image?
    let style: FMButtonStyleType
    let size: FMComponentSize
    let imageOnLeft: Bool?
    let cornerRadius: CGFloat
    let textFont: Font
    let textWeight: Font.Weight
    let action: () -> Void

    init(title: String,
         icon: Image? = nil,
         imageOnLeft: Bool,
         style: FMButtonStyleType,
         size: FMComponentSize = .medium,
         cornerRadius: CGFloat,
         textFont: Font,
         textWeight: Font.Weight ,
         action: @escaping () -> Void
    ) {
        self.title = title
        self.icon = icon
        self.style = style
        self.size = size
        self.action = action
        self.imageOnLeft = imageOnLeft
        self.cornerRadius = cornerRadius
        self.textFont = textFont
        self.textWeight = textWeight
    }

    var body: some View {
        Button(action: action) {
            HStack {
                if let icon = icon, let imageOnLeft = imageOnLeft, imageOnLeft {
                    icon
                }
                
                Text(title)
                    .font(textFont)
                    .fontWeight(textWeight)
                
                if let icon = icon, let imageOnLeft = imageOnLeft, !imageOnLeft {
                    icon
                }
            }
            .frame(maxWidth: .infinity)
            .padding(sizePadding)
            .background(backgroundColor)
            .foregroundColor(.primaryText)
            .overlay(border)
            .shadow(radius: style == .primary || style == .outlined ? 4 : 0)
            .cornerRadius(cornerRadius)
        }
    }

    private var backgroundColor: Color {
        switch style {
        case .primary: return Color.fmSecondary
        case .secondary: return Color.fmCard
        case .destructive: return Color.red4
        case .outlined: return Color.clear // Transparent background for outlined
        }
    }

    private var border: some View {
        // Only apply border for outlined buttons
        style == .outlined ? RoundedRectangle(cornerRadius: cornerRadius)
            .stroke(Color.gray, lineWidth: 2) : nil
    }

    private var sizePadding: EdgeInsets {
        switch size {
        case .small: return EdgeInsets(top: 8, leading: 16, bottom: 8, trailing: 16)
        case .medium: return EdgeInsets(top: 12, leading: 24, bottom: 12, trailing: 24)
        case .large: return EdgeInsets(top: 16, leading: 32, bottom: 16, trailing: 32)
        }
    }
}
