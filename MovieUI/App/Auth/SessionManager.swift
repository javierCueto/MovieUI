//
//  SessionManager.swift
//  MovieUI
//
//  Created by Javier Cueto on 19/08/22.
//

import SwiftUI

protocol SessionManager {
    var isLogged: Binding<Bool> { get set }
    func logOut()
    func logIn() -> Bool
}

final class SessionManagerImpl: SessionManager  {

    
    var isLogged: Binding<Bool> = .constant(true)
    
    func logOut() {
        isLogged = .constant(false)
    }
    
    func logIn() -> Bool {
        isLogged = .constant(true)
        return true
    }
    
}
