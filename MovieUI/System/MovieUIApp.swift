//
//  MovieUIApp.swift
//  MovieUI
//
//  Created by Javier Cueto on 10/08/22.
//

import SwiftUI

@main
struct MovieUIApp: App {
    let persistenceController = PersistenceController.shared
    let appCoordinator: Coordinator = AppCoordinatorImpl(appFactory: AppFactoryImpl())

    var body: some Scene {
        WindowGroup {
            appCoordinator.start()
        }
    }
}
