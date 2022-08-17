//
//  LoginUseCase.swift
//  MovieUI
//
//  Created by Javier Cueto on 12/08/22.
//

final class LoginUseCaseImpl{
    
    func execute(password: String, email: String) async -> (valid: Bool,message: String){
        do {
            try await Task.sleep(nanoseconds: 1_000_000_000)
            print("is loaded")
            if password=="123" && email.lowercased()=="pedro@picapiedra.com"{
                return (true,"success")
            }else{
                return (false,"Invalid credentials")
            }
        }catch {
            return (false,"Error on timer")
        }

    }
    
}
