//
//  LoginUseCase.swift
//  MovieUI
//
//  Created by Javier Cueto on 12/08/22.
//

final class LoginUseCaseImpl{
    
    var sessionManager: SessionManager
    
    init(sessionManager: SessionManager) {
        self.sessionManager = sessionManager
    }
    
    func execute(password: String, email: String) async -> (valid: Bool,message: String){
        do {
            try await Task.sleep(nanoseconds: 1_000_000_000)
            if password=="123" && email.lowercased()=="pedro@picapiedra.com"{
                sessionManager.isLogged = .constant(true)
                return (true,"success")
            }else{
                return (false,"Invalid credentials")
            }
        }catch {
            return (false,"Error on timer")
        }

    }
    
}
