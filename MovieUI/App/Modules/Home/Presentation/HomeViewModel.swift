//
//  HomeViewModel.swift
//  MovieUI
//
//  Created by Javier Cueto on 19/08/22.
//

import Combine

protocol HomeViewModel {
    func logOut()
}

final class HomeViewModelImpl: HomeViewModel {
    
    private var logoutUseCase: LogoutUseCase
    private let backRootView: PassthroughSubject<Bool, Never>
    
    init(logoutUseCase: LogoutUseCase, backRootView: PassthroughSubject<Bool, Never>) {
        self.logoutUseCase = logoutUseCase
        self.backRootView = backRootView
        print("init HomeViewModelImpl")
    }
    
    func logOut() {
        logoutUseCase.execute()
        backRootView.send(true)
    }
    
    deinit {
        print("deinit HomeViewModelImpl")
    }
}
