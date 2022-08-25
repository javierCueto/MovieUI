//
//  HomeView.swift
//  MovieUI
//
//  Created by Javier Cueto on 17/08/22.
//

import SwiftUI

struct HomeView: View {
    let viewModel: HomeViewModel
    
    init(viewModel: HomeViewModel) {
        self.viewModel = viewModel
        print("HomeView was started")
    }
    @Environment(\.presentationMode) var dismiss
    var body: some View {
        NavigationView {
            VStack{
                Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
                
                Button {
                    viewModel.logOut()
                    dismiss.wrappedValue.dismiss()
                } label: {
                    Text("logout")
                }
            }
     

        }.navigationBarTitleDisplayMode(.inline)
        .navigationTitle("Movies UI")
        .navigationBarBackButtonHidden(true)
        .navigationViewStyle(StackNavigationViewStyle())
    }
}
