//
//  LoginView.swift
//  MovieUI
//
//  Created by Javier Cueto on 11/08/22.
//

import SwiftUI

struct LoginView: View {
    @State var email: String = ""
    @State var password: String = ""
    @State var showingModal: Bool = false
    
    var body: some View {
        ZStack {
            if $showingModal.wrappedValue {
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
                        if email.isEmpty {
                            Text("Email")
                                .foregroundColor(.black)
                                .opacity(0.4)
                        }
                        TextField("", text: $email)
                    }
                    .frame(maxHeight: 40)
                    .padding(.horizontal)
                    .overlay(RoundedRectangle(cornerRadius: 8).stroke(Color.black, lineWidth: 1))
                    .padding(.horizontal)
                    
                    ZStack(alignment: .leading) {
                        if password.isEmpty {
                            Text("Password")
                                .foregroundColor(.black)
                                .opacity(0.4)
                        }
                        SecureField("Password", text: $password)
                    }
                    .frame(maxHeight: 40)
                    .padding(.horizontal)
                    .overlay(RoundedRectangle(cornerRadius: 8).stroke(Color.black, lineWidth: 1))
                    .padding(.horizontal)
                    
                    Button("Save") {
                        print("logged")
                        showingModal.toggle()
                    }.frame(maxWidth: .infinity, maxHeight: 40)
                        .background(Color.red)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                        .padding(.horizontal)
                }
                
                
                Spacer()
            }.background(
                Image("wallpaper")
                    .resizable()
                    .aspectRatio(contentMode: ContentMode.fill)
                    .blur(radius: 100)
                    .ignoresSafeArea()
            )
            
        }
        
       
    }
}

//struct LoginView_Previews: PreviewProvider {
//    static var previews: some View {
//        LoginView()
//    }
//}
