//
//  AppRootViewModel.swift
//  MovieUI
//
//  Created by Javier Cueto on 18/08/22.
//

import Combine

final class AppRootViewModel: ObservableObject{
    
    @Published var toHome: Bool = false
    @Published var modalLogin: Bool = false
    {
        didSet {
  
            toHome = sessionManager.isLogged.wrappedValue
           // print("updating value home", toHome)
        }
    }
    var backRootView: PassthroughSubject<Bool, Never>
    let sessionManager: SessionManager
    
    init(sessionManager: SessionManager, backRootView: PassthroughSubject<Bool, Never> ) {
        self.sessionManager = sessionManager
        self.backRootView = backRootView
        onAppear()
    }
    
    func onAppear(){
        modalLogin = !sessionManager.isLogged.wrappedValue
    }
    
}
