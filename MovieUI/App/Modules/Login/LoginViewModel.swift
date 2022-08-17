//
//  LoginViewModel.swift
//  MovieUI
//
//  Created by Javier Cueto on 12/08/22.
//

import Combine
import UIKit

@MainActor final class LoginViewModel: ObservableObject{
    //TODO: move validations to another use case
    @Published var email: String = "" {
        didSet {
            validEmail = emailValidationUseCase.textFieldValidatorEmail(email)
            buttonDisabled = !(validEmail && !password.isEmpty)
        }
    }
    
    @Published var password: String = "" {
        didSet {
            validEmail = emailValidationUseCase.textFieldValidatorEmail(email)
            buttonDisabled = !(validEmail && !password.isEmpty)
        }
    }
    @Published var showingModal: Bool = false
    @Published var showMessage: String = ""
    @Published var showingAlertModal: Bool = false
    @Published var buttonDisabled: Bool = true
    @Published var goToHome: Bool = false
    
    private var validEmail = false
    
    private var loginUseCase = LoginUseCaseImpl()
    private var emailValidationUseCase = EmailValidationUseCaseImpl()
    
    
    func login(){
       
        showingModal = true
        
        Task {
            let response = await loginUseCase.execute(password: password, email: email)
    
            goToHome = true
            showingModal = false
            showingAlertModal = !response.valid
            showMessage = response.message
        }

        
    }
}
