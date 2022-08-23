//
//  CheckIsLoggedUseCase.swift
//  MovieUI
//
//  Created by Javier Cueto on 23/08/22.
//

protocol CheckIsLoggedUseCase {
    func isLogged() -> Bool
}

struct CheckIsLoggedUseCaseImpl: CheckIsLoggedUseCase {
    let sessionManager: SessionManager
    
    func isLogged() -> Bool {
        sessionManager.isLogged.wrappedValue
    }
}
