//
//  HomeCoordinator.swift
//  MovieUI
//
//  Created by Javier Cueto on 18/08/22.
//

import SwiftUI

protocol HomeCoordinator {
    
}

final class HomeCoordinatorImpl: Coordinator {
    private let homeFactory: HomeFactory
    
    init(homeFactory: HomeFactory){
        self.homeFactory = homeFactory
    }
    
    func start() -> AnyView {
        homeFactory.makeHome()
    }
    
}

extension HomeCoordinatorImpl: HomeCoordinator {
    
}
