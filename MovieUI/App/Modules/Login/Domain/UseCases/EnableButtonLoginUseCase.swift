//
//  EnableButtonLoginUseCase.swift
//  MovieUI
//
//  Created by Javier Cueto on 23/08/22.
//

protocol EnableButtonLoginUseCase {
    mutating func execute(email: String, password: String) -> Bool
}

struct EnableButtonLoginUseCaseImpl: EnableButtonLoginUseCase {
    private let emailValidationUseCase: EmailValidationUseCase
    private var validEmail = false
    
    init(emailValidationUseCase: EmailValidationUseCase) {
        self.emailValidationUseCase = emailValidationUseCase
    }
    
    mutating func execute(email: String, password: String) -> Bool {
        validEmail = emailValidationUseCase.textFieldValidatorEmail(email)
        return !(validEmail && !password.isEmpty)
    }
}
