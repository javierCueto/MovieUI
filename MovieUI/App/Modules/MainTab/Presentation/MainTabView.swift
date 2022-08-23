//
//  MainTabView.swift
//  MovieUI
//
//  Created by Javier Cueto on 23/08/22.
//

import SwiftUI

struct MainTabView: View {
    var body: some View {
        TabView {
            TestView()
                .tabItem {
                    Image(systemName: "house.fill")
                    Text("Home")
                }
            
            TestView()
                .tabItem {
                    Image(systemName: "magnifyingglass")
                    Text("Search")
                }
        }.navigationBarTitleDisplayMode(.inline)
            .navigationTitle("Movies UI")
            .navigationBarBackButtonHidden(true)
    }
}

struct MainTabView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView()
    }
}
