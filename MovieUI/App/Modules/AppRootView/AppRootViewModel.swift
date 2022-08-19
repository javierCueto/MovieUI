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
   
            if modalLogin {
                print("modal login was updated")
            }else {
                toHome = sessionManager.isLogged.wrappedValue
            }
        }
    }
    
    var backRootView: PassthroughSubject<Bool, Never> {
        didSet {
            print("wasUpdate")
        }
    }
    
    
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
