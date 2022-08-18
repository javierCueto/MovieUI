//
//  AppCoordinator.swift
//  MovieUI
//
//  Created by Javier Cueto on 17/08/22.
//


import SwiftUI

class AppCoordinatorImpl {
    private let appFactory: AppFactory
    
    init(appFactory: AppFactory){
        self.appFactory = appFactory
    }
    
    func start() -> AnyView {
        appFactory.makeAppRootView(coordinator: self)
    }
    
    func goHome() -> AnyView {
        appFactory.makeHome()
    }
    
    func goLogin(isLogged: Binding<Bool>) -> AnyView {
        appFactory.makeLogin(coordinator: self, isLogged: isLogged)
    }
    
    
}
