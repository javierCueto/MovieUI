//
//  AppFactory+Home.swift
//  MovieUI
//
//  Created by Javier Cueto on 24/08/22.
//

import SwiftUI

protocol HomeFactory {
    func makeHome() -> AnyView
}

extension AppFactoryImpl: HomeFactory {
    func makeHome() -> AnyView {
        let viewModel = HomeViewModelImpl(sessionManager: sessionManager, backRootView: backRootView)
        let view = HomeView(viewModel: viewModel)
        return AnyView(view)
    }
}

