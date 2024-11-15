//
//  SignUpViewModel.swift
//  FinMate
//
//  Created by Temur Chitashvili on 15.11.24.
//

import Foundation

final class SignUpViewModel: ObservableObject {
    @Published var userNeedsSignUp: Bool = true
    @Published var selectedPage: Int = 0
    
    @Published var email: String = ""
    @Published var name: String = ""
    @Published var password: String = ""
    @Published var confirmPassword: String = ""
    
    @Published var passwordIsExposed: Bool = false
    @Published var confirmPasswordIsExposed: Bool = false
    
    var nameValidationIsSuccess: Bool {
        !name.isEmpty
    }
    
    var nameFailureError: String {
        if !nameValidationIsSuccess {
            return "You Should Input Name"
        }
        return ""
    }
    
    var isEmailValid: Bool {
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPredicate = NSPredicate(format: "SELF MATCHES %@", emailRegex)
        return emailPredicate.evaluate(with: email)
    }
    
    var emailFailureError: String {
        if !isEmailValid {
            return "Please Input Correct Email"
        }
        
        return ""
    }
}

enum FocusedField: Hashable {
    case name
    case email
    case password
    case confirmPassword
}
