//
//  AppRootBodyView.swift
//  MovieUI
//
//  Created by Javier Cueto on 23/08/22.
//

import SwiftUI

struct AppRootBodyView: View {
    @ObservedObject var viewModel: AppRootViewModel
    let coordinator: AppCoordinator
    var body: some View {
        ZStack {
            Color.red
                .ignoresSafeArea()
            VStack {
                Text(AppLocalizable.appName)
                    .font(.largeTitle)
                    .bold()
                    .foregroundColor(.white)
                ProgressView()
                NavigationLink(destination: SafeView { coordinator.goHome() },isActive: $viewModel.toHome, label: {EmptyView() })
            }
        }
        .hiddenNavigationBarStyle()
    }
}
