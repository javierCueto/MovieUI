//
//  LoginViewModel.swift
//  MovieUI
//
//  Created by Javier Cueto on 12/08/22.
//

import Combine
import SwiftUI

final class LoginViewModel: ObservableObject{
    
    // MARK: - Public properties
    @Published var email: String = "" {
        didSet {
            buttonDisabled = enableButtonLoginUseCase.execute(email: email, password: password)
        }
    }
    
    @Published var password: String = "" {
        didSet {
            buttonDisabled = enableButtonLoginUseCase.execute(email: email, password: password)
        }
    }
    
    @Published var showingModal: Bool = false
    @Published var showMessage: String = ""
    @Published var showingAlertModal: Bool = false
    @Published var buttonDisabled: Bool = true
    
    // MARK: - private properties
    private var loginUseCase: LoginUseCase
    private var modalLogin: Binding<Bool>
    private var enableButtonLoginUseCase: EnableButtonLoginUseCase
    
    init(
        modalLogin: Binding<Bool>,
        loginUseCase: LoginUseCase,
        enableButtonLoginUseCase: EnableButtonLoginUseCase
    ) {
        self.modalLogin = modalLogin
        self.loginUseCase = loginUseCase
        self.enableButtonLoginUseCase = enableButtonLoginUseCase
        print("loging was instance too")
    }
    
    func login(){
        
        showingModal = true
        
        Task {
            let response = await loginUseCase.execute(password: password, email: email)
            
            await MainActor.run {
                if(response.valid){
                    modalLogin.wrappedValue = false
                }
                
                showingModal = false
                showingAlertModal = !response.valid
                showMessage = response.message
            }
            
        }
        
        
    }
}
