//
//  HomeView.swift
//  MovieUI
//
//  Created by Javier Cueto on 17/08/22.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationView {
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
        }.navigationBarTitleDisplayMode(.inline)
        .navigationTitle("Movies UI")
        .navigationBarBackButtonHidden(true)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
