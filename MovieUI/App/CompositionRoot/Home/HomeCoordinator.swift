//
//  HomeCoordinator.swift
//  MovieUI
//
//  Created by Javier Cueto on 18/08/22.
//

import SwiftUI

final class HomeCoordinator: Coordinator {
    private let appFactory: AppFactory
    
    init(appFactory: AppFactory){
        self.appFactory = appFactory
    }
    
    func start() -> AnyView {
        appFactory.makeHome()
    }
    
    
}
