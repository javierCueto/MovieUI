//
//  MainTabView.swift
//  MovieUI
//
//  Created by Javier Cueto on 23/08/22.
//

import SwiftUI

struct MainTabView: View {
    
    var coordinator: MainTabCoordinator
    
    var body: some View {
        TabView {
            SafeView { coordinator.homeModule() }
                .tabItem {
                    Image(systemName: "house.fill")
                    Text("Home")
                }
            
            SafeView { EmptyView()}
                .tabItem {
                    Image(systemName: "magnifyingglass")
                    Text("Search")
                }
        }.navigationBarTitleDisplayMode(.inline)
            .navigationTitle("Movies UI")
            .navigationBarBackButtonHidden(true)
            .navigationViewStyle(StackNavigationViewStyle())
    }
}
