//
//  AppCoordinator.swift
//  MovieUI
//
//  Created by Javier Cueto on 17/08/22.
//


import SwiftUI
protocol Coordinator {
    func start() -> AnyView
}

protocol AppCoordinator {
    func goHome() -> AnyView
    func goLogin(isLogged: Binding<Bool>) -> AnyView
}

final class AppCoordinatorImpl: Coordinator  {
    private let appFactory: AppFactory
    
    init(appFactory: AppFactory){
        self.appFactory = appFactory
    }
    
    func start() -> AnyView {
        appFactory.makeAppRootView(coordinator: self)
    }
    
}

extension AppCoordinatorImpl: AppCoordinator {
    func goHome() -> AnyView {
        let coordinator = HomeCoordinator(appFactory: appFactory)
        return coordinator.start()
    }
    
    func goLogin(isLogged: Binding<Bool>) -> AnyView {
        appFactory.makeLogin(isLogged: isLogged)
    }
}
