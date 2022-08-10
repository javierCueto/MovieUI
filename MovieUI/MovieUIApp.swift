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

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
