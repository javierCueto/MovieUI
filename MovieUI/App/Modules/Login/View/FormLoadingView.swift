//
//  FormLoadingView.swift
//  MovieUI
//
//  Created by Javier Cueto on 23/08/22.
//

import SwiftUI

struct FormLoadingView: View {
    @ObservedObject var viewModel: LoginViewModel
    
    var body: some View {
        Text(AppLocalizable.appName)
            .foregroundColor(.red)
            .font(.title)
        Group {
            ZStack(alignment: .leading) {
                if viewModel.email.isEmpty {
                    Text(AppLocalizable.email)
                        .foregroundColor(.black)
                        .opacity(ViewValues.customPlaceHolderOpacity)
                }
                TextField(String(), text: $viewModel.email)
                    .keyboardType(.emailAddress)
                
            }
            .frame(maxHeight: ViewValues.heightTFB)
            .padding(.horizontal)
            .overlay(
                RoundedRectangle(cornerRadius: ViewValues.cornerRadiusTFB)
                    .stroke(Color.black, lineWidth: ViewValues.defaultBorder)
            )
            .padding(.horizontal)
            
            ZStack(alignment: .leading) {
                if viewModel.password.isEmpty {
                    Text(AppLocalizable.password)
                        .foregroundColor(.black)
                        .opacity(ViewValues.customPlaceHolderOpacity)
                }
                SecureField(String(), text: $viewModel.password)
            }
            .frame(maxHeight: ViewValues.heightTFB)
            .padding(.horizontal)
            .overlay(
                RoundedRectangle(cornerRadius: ViewValues.cornerRadiusTFB)
                    .stroke(Color.black, lineWidth: ViewValues.defaultBorder)
            )
            .padding(.horizontal)
            
            Button(AppLocalizable.save) {
                viewModel.login()
            }.frame(maxWidth: .infinity, maxHeight: ViewValues.heightTFB)
                .background(viewModel.buttonDisabled ? Color.gray : Color.red)
                .foregroundColor(.white)
                .cornerRadius(ViewValues.cornerRadiusTFB)
                .padding(.horizontal)
                .disabled(viewModel.buttonDisabled)
                .alert(isPresented: $viewModel.showingAlertModal) {
                    Alert(title: Text(AppLocalizable.validationMessage), message: Text(viewModel.showMessage))
                }
        }
    }
}
