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
    @Published var email: String = String() {
        didSet {
            buttonDisabled = enableButtonLoginUseCase.execute(email: email, password: password)
        }
    }
    
    @Published var password: String = String() {
        didSet {
            buttonDisabled = enableButtonLoginUseCase.execute(email: email, password: password)
        }
    }
    
    @Published var showingModal: Bool = false
    @Published var showMessage: String = String()
    @Published var showingAlertModal: Bool = false
    @Published var buttonDisabled: Bool = true
    
    // MARK: - private properties
    private var loginUseCase: LoginUseCase
    private var modalLogin: Binding<Bool>
    private var enableButtonLoginUseCase: EnableButtonLoginUseCase
    
    private let backRootView: PassthroughSubject<Bool, Never>
    
    init(
        modalLogin: Binding<Bool>,
        loginUseCase: LoginUseCase,
        enableButtonLoginUseCase: EnableButtonLoginUseCase, backRootView: PassthroughSubject<Bool, Never>
    ) {
        self.modalLogin = modalLogin
        self.loginUseCase = loginUseCase
        self.enableButtonLoginUseCase = enableButtonLoginUseCase
        self.backRootView = backRootView
        debugPrint("login was instance too")
    }
    
    func login(){
        showingModal = true
        Task {
            let response = await loginUseCase.execute(password: password, email: email)
            await MainActor.run {
                if(response.valid){
                    backRootView.send(true)
                   // modalLogin.wrappedValue = false
                }
                showingModal = false
                showingAlertModal = !response.valid
                showMessage = response.message
            }
            
        }
    }
}
