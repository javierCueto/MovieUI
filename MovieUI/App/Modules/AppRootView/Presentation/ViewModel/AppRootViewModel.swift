//
//  AppRootViewModel.swift
//  MovieUI
//
//  Created by Javier Cueto on 18/08/22.
//

import Combine

final class AppRootViewModel: ObservableObject{
    
    @Published var toHome: Bool = false
    @Published var modalLogin: Bool = false {
        didSet {
            toHome = checkIsLoggedUseCase.isLogged()
        }
    }
    
    var backRootView: PassthroughSubject<Bool, Never>
    private let checkIsLoggedUseCase: CheckIsLoggedUseCase
    
    init(checkIsLoggedUseCase: CheckIsLoggedUseCase, backRootView: PassthroughSubject<Bool, Never> ) {
        self.checkIsLoggedUseCase = checkIsLoggedUseCase
        self.backRootView = backRootView
        onAppear()
    }
    
    func onAppear(){
        modalLogin = !checkIsLoggedUseCase.isLogged()
    }
    
}
