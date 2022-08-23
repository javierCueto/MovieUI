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
    private var emailValidationUseCase = EmailValidationUseCaseImpl()
    private var validEmail = false
    
    mutating func execute(email: String, password: String) -> Bool {
        validEmail = emailValidationUseCase.textFieldValidatorEmail(email)
        return !(validEmail && !password.isEmpty)
    }
}
