//
//  MainTabCoordinator.swift
//  MovieUI
//
//  Created by Javier Cueto on 23/08/22.
//

import SwiftUI

protocol MainTabCoordinator {
    func homeModule() -> AnyView
    func searSearch() -> AnyView
}

final class MainTabCoordinatorImpl: Coordinator {
    private var mainTabFactory: MainTabFactory
    
    init(mainTabFactory: MainTabFactory){
        self.mainTabFactory = mainTabFactory
    }
    
    func start() -> AnyView {
        mainTabFactory.makeTab(coordinator: self) //?? AnyView(EmptyView())
    }
    
    deinit {
        print("MainTabCoordinatorImpl was deinit")
    }
}

extension MainTabCoordinatorImpl: MainTabCoordinator {
    func homeModule() -> AnyView {
        guard let homeFactory = mainTabFactory as? HomeFactory else { return AnyView(EmptyView()) }
        let coordinator = HomeCoordinatorImpl(homeFactory: homeFactory)
        return coordinator.start()
    }
    
    func searSearch() -> AnyView {
        AnyView(EmptyView())
    }
    
}

