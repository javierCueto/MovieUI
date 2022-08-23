//
//  LoadingModalView.swift
//  MovieUI
//
//  Created by Javier Cueto on 23/08/22.
//

import SwiftUI

struct LoadingModalView: View {
    var body: some View {
        ZStack {
            Color.black.opacity(ViewValues.defaultOpacity)
                .ignoresSafeArea()
            ProgressView(AppLocalizable.loadingMessage.localized)
                .frame(width: ViewValues.widthLoadingView, height: ViewValues.heighLoadingView)
                .background(Color.white)
                .cornerRadius(ViewValues.cornerRadiusLoadingView).shadow(radius: ViewValues.cornerRadiusLoadingView)
        }
        .zIndex(ViewValues.zIndexLoadingView)
    }
}
