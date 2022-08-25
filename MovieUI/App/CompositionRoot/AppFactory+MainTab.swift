//
//  AppFactory+MainTab.swift
//  MovieUI
//
//  Created by Javier Cueto on 24/08/22.
//

import SwiftUI


protocol MainTabFactory {
    func makeTab(coordinator: MainTabCoordinator) -> AnyView
}

extension AppFactoryImpl: MainTabFactory {
    
    func makeTab(coordinator: MainTabCoordinator) -> AnyView {
        let view = MainTabView(coordinator: coordinator)
        return AnyView(view)
    }
    
    
}

