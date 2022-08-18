//
//  FactoryApp.swift
//  MovieUI
//
//  Created by Javier Cueto on 11/08/22.
//

import SwiftUI

protocol AppFactory {
    func makeAppRootView(coordinator: AppCoordinator) -> AnyView
    func makeLogin(isLogged: Binding<Bool>) -> AnyView
    func makeHome() -> AnyView
    
}


struct AppFactoryImpl: AppFactory {
    func makeAppRootView(coordinator: AppCoordinator) -> AnyView {
        return AnyView(AppRootView(coordinator: coordinator))
    }
    
    func makeLogin(isLogged: Binding<Bool>) -> AnyView {
        let viewModel = LoginViewModel(isLogged: isLogged)
        let view = LoginView(viewModel: viewModel)
        
        return AnyView(view)
    }
    
    
    func makeHome() -> AnyView {
        let view = HomeView()
        
        return AnyView(view)
    }
}
