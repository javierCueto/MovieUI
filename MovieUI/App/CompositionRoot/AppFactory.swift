//
//  FactoryApp.swift
//  MovieUI
//
//  Created by Javier Cueto on 11/08/22.
//

import SwiftUI

protocol AppFactory {
    func makeLogin() -> AnyView
}


struct AppFactoryImpl: AppFactory {
    func makeLogin() -> AnyView {
        
        return AnyView(LoginView())
    }
}
