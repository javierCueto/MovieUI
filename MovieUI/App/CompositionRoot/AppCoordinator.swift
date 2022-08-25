//
//  AppCoordinator.swift
//  MovieUI
//
//  Created by Javier Cueto on 17/08/22.
//

import SwiftUI
protocol AppCoordinator {
    func goMainTab() -> AnyView
    func goLogin(modalLogin: Binding<Bool>) -> AnyView
}

class AppCoordinatorImpl: Coordinator  {
    private let appFactory: AppFactory
    
    init(appFactory: AppFactory){
        self.appFactory = appFactory
    }
    
    func start() -> AnyView {
        appFactory.makeAppRootView(coordinator: self)
    }
    
}

extension AppCoordinatorImpl: AppCoordinator {
    func goMainTab() -> AnyView {
        let coordinator = MainTabCoordinatorImpl(mainTabFactory: appFactory)
        return coordinator.start()
    }
    
    func goLogin(modalLogin: Binding<Bool>) -> AnyView {
        appFactory.makeLogin(modalLogin: modalLogin)
    }
}
