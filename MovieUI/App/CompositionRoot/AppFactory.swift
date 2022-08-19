//
//  FactoryApp.swift
//  MovieUI
//
//  Created by Javier Cueto on 11/08/22.
//

import SwiftUI
import Combine

protocol AppFactory {
    func makeAppRootView(coordinator: AppCoordinator) -> AnyView
    func makeLogin(modalLogin: Binding<Bool>) -> AnyView
    func makeHome() -> AnyView
    
}


struct AppFactoryImpl: AppFactory {
    let sessionManager = SessionManagerImpl()
    var backRootView = PassthroughSubject<Bool, Never>()
    
    func makeAppRootView(coordinator: AppCoordinator) -> AnyView {
        let viewModel = AppRootViewModel(sessionManager: sessionManager, backRootView: backRootView)
        let view = AppRootView(viewModel: viewModel, coordinator: coordinator)
        return AnyView(view)
    }
    
    func makeLogin(modalLogin: Binding<Bool>) -> AnyView {
        let loginUseCase = LoginUseCaseImpl(sessionManager: sessionManager)
        let viewModel = LoginViewModel(modalLogin: modalLogin, loginUseCase: loginUseCase)
        let view = LoginView(viewModel: viewModel)
        
        return AnyView(view)
    }
    
    
    func makeHome() -> AnyView {
        print("home was created on factory_________")
        let viewModel = HomeViewModelImpl(sessionManager: sessionManager, backRootView: backRootView)
        let view = HomeView(viewModel: viewModel)
        
        return AnyView(view)
    }
}
