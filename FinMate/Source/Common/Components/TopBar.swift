//
//  TopBar.swift
//  FinMate
//
//  Created by Temur Chitashvili on 15.11.24.
//


import SwiftUI

struct TopBar: View {
    let pageNames: [String]
    @Binding var selectedPage: Int
    var body: some View {
        HStack {
            ForEach(pageNames.indices, id: \.self) { index in
                VStack {
                    FMButton(action: {
                        withAnimation {
                            selectedPage = index
                        }
                        print(pageNames[index])
                    },
                             foregroundColor: .clear,
                             cornerRadius: 0,
                             shadowColor: .clear,
                             shadowRadius: 0,
                             contentAlignment: .center,
                             strokeColor: nil,
                             strokeWidth: nil) {
                        FMText(content: pageNames[index],
                               font: .callout,
                               color: index == selectedPage ? .green4 : .blue8,
                               fontWeight: .regular)
                        .frame(maxWidth: .infinity)
                    }
                    
                    if index == selectedPage {
                        RoundedRectangle(cornerRadius: 2)
                            .frame(height: 4)
                            .foregroundStyle(.green4)
                    } else {
                        RoundedRectangle(cornerRadius: 2)
                            .frame(height: 4)
                            .foregroundStyle(.blue8)
                    }
                }
            }
        }
    }
}
