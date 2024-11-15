//
//  SignUpView.swift
//  FinMate
//
//  Created by Temur Chitashvili on 15.11.24.
//

import SwiftUI

struct SignUpView: View {
    @StateObject var signUpViewModel: SignUpViewModel
    @FocusState var focus: FocusedField?
    
    var body: some View {
        ZStack {
            Color.fmAccentLighter
                .ignoresSafeArea(edges: .bottom)
            
            VStack {
                greetingTextAndAppName
                
                switch signUpViewModel.selectedPage {
                case 0:
                    signUpContent
                default:
                    Text("PPP")
                }
                Spacer()
            }
        }
    }
    
    private var greetingTextAndAppName: some View {
        VStack(spacing: AppConstants.Paddings.medium) {
            FMText(
                content: "FinMate",
                font: .largeTitle,
                color: .fmAccentLighter,
                fontWeight: .bold
            )
            
            FMText(
                content: "Welcome to FinMate! 🎉",
                font: .title2,
                color: .primaryDarkText,
                fontWeight: .regular
            )
            
            FMText(
                content: "Sign up to take control of your finances and achieve your goals with ease.Continue your journey toward smarter money management!",
                font: .caption,
                color: .secondaryText,
                alignment: .center,
                fontWeight: .regular
            )
            
            TopBar(
                pageNames: ["Sign Up", "Log In"],
                selectedPage: $signUpViewModel.selectedPage
            )
        }
        .frame(maxWidth: .infinity)
        .padding()
        .background(
            FMCardView(
                foregroundColor: .primaryText,
                cornerRadius: 0,
                shadowColor: .clear,
                shadowRadius: 0,
                contentAlignment: .center,
                strokeColor: nil,
                strokeWidth: nil
            )
        )
    }
    
    private var signUpContent: some View {
        VStackLayout(spacing: AppConstants.Paddings.small) {
            VStack(alignment: .leading) {
                IconTextField(
                    systemImage: "person",
                    placeholder: "Name",
                    text: $signUpViewModel.name,
                    textColor: !signUpViewModel.nameValidationIsSuccess ? .primaryDarkText : .red6,
                    borderColor: focus == .name && !signUpViewModel.nameValidationIsSuccess ? .red6 : .clear
                )
                .focused($focus, equals: .name)
                
                if focus == .name && !signUpViewModel.nameValidationIsSuccess {
                    FMText(
                        content: signUpViewModel.nameFailureError,
                        font: .caption,
                        color: .red4,
                        fontWeight: .regular
                    )
                }
            }
            VStack(alignment: .leading) {
                
                
                IconTextField(
                    systemImage: "envelope",
                    placeholder: "Email",
                    text: $signUpViewModel.email,
                    textColor: !signUpViewModel.isEmailValid ? .primaryDarkText : .red6,
                    borderColor: focus == .email && !signUpViewModel.isEmailValid ? .red6 : .clear
                )
                .focused($focus, equals: .email)
                
                if focus == .email && !signUpViewModel.isEmailValid {
                    FMText(
                        content: signUpViewModel.emailFailureError,
                        font: .caption,
                        color: .red4,
                        fontWeight: .regular
                    )
                }
            }
            
            IconTextField(
                systemImage: "lock",
                placeholder: "Enter Your Password",
                text: $signUpViewModel.password,
                textColor: .clear,
                borderColor: .clear,
                isSecure: true,
                isExposed: $signUpViewModel.passwordIsExposed
            )
            .focused($focus, equals: .password)
            
            IconTextField(
                systemImage: "lock",
                placeholder: "Confirm Your Password",
                text: $signUpViewModel.confirmPassword,
                textColor: .clear,
                borderColor: .clear,
                isSecure: true,
                isExposed: $signUpViewModel.confirmPasswordIsExposed
            )
            .focused($focus, equals: .confirmPassword)
        }
        .padding(AppConstants.Paddings.medium)
        
    }
}

#Preview {
    SignUpView(signUpViewModel: SignUpViewModel())
}

