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
    
    var body: some View {
        
        VStack {
            Spacer()
            
            Text("Movie UI")
                .foregroundColor(.red)
                .font(.title)
            Group {
                TextField("Email", text: $email)
                    .frame(maxHeight: 40)
                    .padding(.horizontal)
                    .overlay(RoundedRectangle(cornerRadius: 8).stroke(Color.black, lineWidth: 1))
                    .padding(.horizontal)
                
                SecureField("Password", text: $password)
                    .frame(maxHeight: 40)
                    .padding(.horizontal)
                    .overlay(RoundedRectangle(cornerRadius: 8).stroke(Color.black, lineWidth: 1))
                    .padding(.horizontal)
                
                Button("Save") {
                    print("logged")
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

//struct LoginView_Previews: PreviewProvider {
//    static var previews: some View {
//        LoginView()
//    }
//}
