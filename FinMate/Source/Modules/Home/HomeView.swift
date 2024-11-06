//
//  HomeView.swift
//  FinMate
//
//  Created by Temur Chitashvili on 07.11.24.
//

import SwiftUI

struct HomeView: View {
    @StateObject var homeViewModel: HomeViewModel

    var body: some View {
        ZStack {
            // Background Color
            Color.fmPrimary
                .ignoresSafeArea()

            VStack(spacing: 16) {
                FMButton(
                title: "Outlined Button",
                icon: Image(systemName: "star"),
                imageOnLeft: true,
                style: .outlined,
                size: .medium,
                cornerRadius: 12,
                textFont: .title2,
                textWeight: .bold,
                action: { print("Outlined Button tapped") }
            )
                // FMButton Variations
                FMButton(
                    title: "Primary Button",
                    icon: Image(systemName: "star.fill"),
                    imageOnLeft: true,
                    style: .primary,
                    size: .medium,
                    cornerRadius: 12,
                    textFont: .title2,
                    textWeight: .bold,
                    action: { print("Primary Button tapped") }
                )

                FMButton(
                    title: "Secondary Button",
                    icon: Image(systemName: "star"),
                    imageOnLeft: false,
                    style: .secondary,
                    size: .medium,
                    cornerRadius: 12,
                    textFont: .title3,
                    textWeight: .semibold,
                    action: { print("Secondary Button tapped") }
                )

                FMButton(
                    title: "Destructive Button",
                    icon: nil,
                    imageOnLeft: true,
                    style: .destructive,
                    size: .large,
                    cornerRadius: 16,
                    textFont: .body,
                    textWeight: .regular,
                    action: { print("Destructive Button tapped") }
                )

                // FMCard Variations
                FMCard(style: .filled) {
                    Text("This is a filled card")
                        .font(.body)
                        .foregroundColor(.primaryText)
                }

                FMCard(style: .outline) {
                    Text("This is an outline card")
                        .font(.body)
                        .foregroundColor(.primaryText)
                }

                FMCard(style: .gradient) {
                    Text("This is a gradient card")
                        .font(.body)
                        .foregroundColor(.white)
                }

                // FMText Variations
                FMText(
                    text: "This is a Title",
                    style: .title,
                    alignment: .center,
                    bodyColorIsWhite: false,
                    titleColorIsWhite: true
                )
                FMText(
                    text: "This is a Body",
                    style: .body,
                    alignment: .leading,
                    bodyColorIsWhite: true,
                    titleColorIsWhite: true
                )
                FMText(
                    text: "This is a Caption",
                    style: .caption,
                    alignment: .trailing,
                    bodyColorIsWhite: false,
                    titleColorIsWhite: true
                )
                FMText(
                    text: "This is a Callout",
                    style: .callout,
                    alignment: .center,
                       bodyColorIsWhite: false,
                       titleColorIsWhite: true
                   )
            }
            .padding()
        }
    }
}

#Preview {
    HomeView(homeViewModel: HomeViewModel())
}

