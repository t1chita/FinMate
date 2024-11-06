//
//  FMText.swift
//  FinMate
//
//  Created by Temur Chitashvili on 05.11.24.
//

import SwiftUI

struct FMText: View {
    let text: String
    let style: FMTextStyleType
    let alignment: TextAlignment
    let bodyColorIsWhite: Bool
    let titleColorIsWhite: Bool
    
    var body: some View {
        Text(text)
            .font(font(for: style))
            .foregroundColor(color(for: style))
            .multilineTextAlignment(alignment)
    }

    private func font(for style: FMTextStyleType) -> Font {
        switch style {
        case .title:
            return .title
        case .body:
            return .body
        case .caption:
            return .caption
        case .callout:
            return .callout
        }
    }
    
    private func color(for style: FMTextStyleType) -> Color {
        switch style {
        case .title:
            return titleColorIsWhite ? .primaryText : .primaryDarkText
        case .body:
            return bodyColorIsWhite ? .primaryText : .secondaryText
        case .caption:
            return .tertiaryText
        case .callout:
            return .fmAccentLighter
        }
    }
    
    private func weight(for style: FMTextStyleType) -> Font.Weight {
        switch style {
        case .title:
            return .bold
        default:
            return .regular
        }
    }
}
