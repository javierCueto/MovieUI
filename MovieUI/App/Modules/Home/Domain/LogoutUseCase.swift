//
//  LogoutUseCase.swift
//  MovieUI
//
//  Created by Javier Cueto on 24/08/22.
//

protocol LogoutUseCase {
    mutating func execute()
}

struct LogoutUseCaseImpl: LogoutUseCase{

    
    private var sessionManager: SessionManager
    
    init(sessionManager: SessionManager) {
        self.sessionManager = sessionManager
    }
    
    mutating func execute() {
        sessionManager.logOut()
    }
    
}
