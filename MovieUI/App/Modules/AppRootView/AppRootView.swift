//
//  LauchScreenView.swift
//  MovieUI
//
//  Created by Javier Cueto on 18/08/22.
//

import SwiftUI
struct AppRootView: View {
    @State var toHome: Bool = false
    @State var isLogged: Bool = true
    let coordinator: AppCoordinatorImpl
    var body: some View {
        NavigationView{
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
        }.fullScreenCover(isPresented: $isLogged) {
            coordinator.goLogin(isLogged: $toHome)
        }
        
    }
}


