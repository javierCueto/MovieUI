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
    let appFactory = AppFactoryImpl()

    var body: some Scene {
        WindowGroup {
            appFactory.makeLogin()
        }
    }
}
