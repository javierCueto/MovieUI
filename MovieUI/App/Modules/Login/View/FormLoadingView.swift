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
            
            FieldFormLoadingView(
                genericField: $viewModel.email,
                textPlaceHolder: AppLocalizable.email,
                secureField: false)
            
            FieldFormLoadingView(
                genericField: $viewModel.password,
                textPlaceHolder: AppLocalizable.password,
                secureField: true)
            
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
