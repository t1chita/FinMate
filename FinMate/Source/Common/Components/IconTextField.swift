//
//  IconTextField.swift
//  FinMate
//
//  Created by Temur Chitashvili on 16.11.24.
//

import SwiftUI

struct IconTextField: View {
    let systemImage: String
    let placeholder: String
    @Binding var text: String
    let textColor: Color
    let borderColor: Color
    var isSecure: Bool = false
    var isExposed: Binding<Bool>? = nil
    
    var body: some View {
        HStack {
            Image(systemName: systemImage)
                .foregroundColor(.blue8)
            
            if isSecure, let isExposed = isExposed {
                if isExposed.wrappedValue {
                    TextField(placeholder, text: $text)
                        .foregroundStyle(textColor)
                        .textFieldStyle(PlainTextFieldStyle())
                } else {
                    SecureField(placeholder, text: $text)
                        .foregroundStyle(textColor)
                        .textFieldStyle(PlainTextFieldStyle())
                }
                
                Button(action: { isExposed.wrappedValue.toggle() }) {
                    Image(systemName: isExposed.wrappedValue ? "eye.slash" : "eye")
                        .foregroundColor(.blue8)
                }
            } else {
                TextField(placeholder, text: $text)
                    .foregroundStyle(textColor)
                    .textFieldStyle(PlainTextFieldStyle())
            }
        }
        .modifier(InputFieldStyle())
        .overlay {
            RoundedRectangle(cornerRadius: AppConstants.CornerRadius.medium)
                .stroke(lineWidth: 1)
                .foregroundStyle(borderColor)
        }
    }
}

// MARK: - View Modifier for Styling
private struct InputFieldStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding(AppConstants.Paddings.medium)
            .background(.white)
            .cornerRadius(AppConstants.CornerRadius.medium)
    }
}
