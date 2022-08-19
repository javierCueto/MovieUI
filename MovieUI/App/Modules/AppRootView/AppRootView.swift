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
        NavigationView{
            AppRootBodyView(viewModel: viewModel, coordinator: coordinator)
        }.fullScreenCover(isPresented: $viewModel.modalLogin) {
            coordinator.goLogin(modalLogin: $viewModel.modalLogin)
        }
        .onReceive(viewModel.backRootView) { value in
            viewModel.onAppear()
        }
        
    }
}


struct AppRootBodyView: View {
    @ObservedObject var viewModel: AppRootViewModel
    let coordinator: AppCoordinator
    var body: some View {
        ZStack {
            Color.red
                .ignoresSafeArea()
            VStack {
                Text("Movie UI")
                    .font(.largeTitle)
                    .bold()
                    .foregroundColor(.white)
                ProgressView()
                NavigationLink(destination: coordinator.goHome(),isActive: $viewModel.toHome, label: {EmptyView() })
            }
        }
        .hiddenNavigationBarStyle()
    }
}

