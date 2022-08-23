//
//  LoginView.swift
//  MovieUI
//
//  Created by Javier Cueto on 11/08/22.
//

import SwiftUI

struct LoginView: View {
    @StateObject var viewModel: LoginViewModel
    
    var body: some View {
        ZStack {
            if $viewModel.showingModal.wrappedValue {
                LoadingModalView()
            }
            VStack {
                Spacer()
                FormLoadingView(viewModel: viewModel)
                Spacer()
            }.background(
                WallpaperLoginView()
            )
        }.navigationBarBackButtonHidden(true)
            .hiddenNavigationBarStyle()
        
        
    }
}


