//
//  LauchScreenView.swift
//  MovieUI
//
//  Created by Javier Cueto on 18/08/22.
//

import SwiftUI
struct AppRootView: View {
    @StateObject var viewModel: AppRootViewModel
    let coordinator: AppCoordinator
    
    var body: some View {
        NavigationView {
            AppRootBodyView(viewModel: viewModel, coordinator: coordinator)
        }.navigationViewStyle(StackNavigationViewStyle())
        .fullScreenCover(isPresented: $viewModel.modalLogin) {
            SafeView { coordinator.goLogin(modalLogin: $viewModel.modalLogin) }
        }
        .onReceive(viewModel.backRootView) { value in
            viewModel.onAppear()
        }
        
        Print("was recreated")
        
    }
}
