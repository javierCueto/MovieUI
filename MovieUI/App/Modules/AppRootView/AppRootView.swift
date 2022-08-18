//
//  LauchScreenView.swift
//  MovieUI
//
//  Created by Javier Cueto on 18/08/22.
//

import SwiftUI
struct AppRootView: View {
    @State private var toHome: Bool = false
    @State private var isLogged: Bool = true
    let coordinator: AppCoordinator
    var body: some View {
        NavigationView{
            AppRootBodyView(toHome: $toHome, coordinator: coordinator)
        }.fullScreenCover(isPresented: $isLogged) {
            coordinator.goLogin(isLogged: $toHome)
        }
        
    }
}


struct AppRootBodyView: View {
    @Binding var toHome: Bool
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
                NavigationLink(destination: coordinator.goHome(),isActive: $toHome, label: {EmptyView() })
            }
        }.hiddenNavigationBarStyle()
    }
}

