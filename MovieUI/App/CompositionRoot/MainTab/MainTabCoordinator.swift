//
//  MainTabCoordinator.swift
//  MovieUI
//
//  Created by Javier Cueto on 23/08/22.
//

import SwiftUI

final class MainTabCoordinator: Coordinator {
    private let mainTabFactory: MainTabFactory
    
    init(mainTabFactory: MainTabFactory){
        self.mainTabFactory = mainTabFactory
    }
    
    func start() -> AnyView {
        mainTabFactory.makeTab()
    }
    
}

