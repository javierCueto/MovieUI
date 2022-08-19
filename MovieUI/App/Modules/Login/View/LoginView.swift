//
//  LoginView.swift
//  MovieUI
//
//  Created by Javier Cueto on 11/08/22.
//

import SwiftUI

//TODO: remove magic numbers and reuse views

struct LoginView: View {
    @StateObject var viewModel: LoginViewModel
    
    @Environment(\.presentationMode) var dismiss
    var body: some View {
        ZStack {
            if $viewModel.showingModal.wrappedValue {
                ZStack {
                    Color.black.opacity(0.5)
                    
                        .ignoresSafeArea()
                    // This VStack is the popup
                    ProgressView("Loading ...")
                        .frame(width: 200, height: 100)
                        .background(Color.white)
                        .cornerRadius(20).shadow(radius: 20)
                }
                .zIndex(2)
                
            }
            
            if $viewModel.showingModal.wrappedValue {
                ZStack {
                    Color.black.opacity(0.5)
                    
                        .ignoresSafeArea()
                    // This VStack is the popup
                    ProgressView("Loading ...")
                        .frame(width: 200, height: 100)
                        .background(Color.white)
                        .cornerRadius(20).shadow(radius: 20)
                }
                .zIndex(2)
                
            }
            
                
                VStack {
                    Spacer()
                    Text("Movie UI")
                        .foregroundColor(.red)
                        .font(.title)
                    Group {
                        ZStack(alignment: .leading) {
                            if viewModel.email.isEmpty {
                                Text("Email")
                                    .foregroundColor(.black)
                                    .opacity(0.4)
                            }
                            TextField("", text: $viewModel.email)
                                .keyboardType(.emailAddress)
                            
                        }
                        .frame(maxHeight: 40)
                        .padding(.horizontal)
                        .overlay(RoundedRectangle(cornerRadius: 8).stroke(Color.black, lineWidth: 1))
                        .padding(.horizontal)
                        
                        ZStack(alignment: .leading) {
                            if viewModel.password.isEmpty {
                                Text("Password")
                                    .foregroundColor(.black)
                                    .opacity(0.4)
                            }
                            SecureField("Password", text: $viewModel.password)
                        }
                        .frame(maxHeight: 40)
                        .padding(.horizontal)
                        .overlay(RoundedRectangle(cornerRadius: 8).stroke(Color.black, lineWidth: 1))
                        .padding(.horizontal)
                        
                        Button("Save") {
                           viewModel.login()
                        }.frame(maxWidth: .infinity, maxHeight: 40)
                            .background(viewModel.buttonDisabled ? Color.gray : Color.red)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                            .padding(.horizontal)
                            .disabled(viewModel.buttonDisabled)
                            .alert(isPresented: $viewModel.showingAlertModal) {
                                Alert(title: Text("Validation"), message: Text(viewModel.showMessage))
                            }
                    }
                    
                    
                    Spacer()
                }.background(
                    Image("wallpaper")
                        .resizable()
                        .aspectRatio(contentMode: ContentMode.fill)
                        .blur(radius: 100)
                        .ignoresSafeArea()
                )
               
            
        }.navigationBarBackButtonHidden(true)
            .hiddenNavigationBarStyle()
        
        
    }
}


