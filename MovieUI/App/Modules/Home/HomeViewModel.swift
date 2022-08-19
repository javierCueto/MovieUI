//
//  HomeViewModel.swift
//  MovieUI
//
//  Created by Javier Cueto on 19/08/22.
//

import Combine

final class HomeViewModel {
    
    let sessionManager: SessionManager
    let backRootView: PassthroughSubject<Bool, Never>
    
    init(sessionManager: SessionManager, backRootView: PassthroughSubject<Bool, Never>) {
        self.sessionManager = sessionManager
        self.backRootView = backRootView
    }
    
    func logOut() {
        sessionManager.logOut()
        backRootView.send(true)
    }
    
}
