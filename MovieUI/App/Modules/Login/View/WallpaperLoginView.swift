//
//  WalpaperLoginView.swift
//  MovieUI
//
//  Created by Javier Cueto on 23/08/22.
//

import SwiftUI

struct WallpaperLoginView: View {
    var body: some View {
        Image(CImageIcon.wallpaperLoginView)
            .resizable()
            .aspectRatio(contentMode: ContentMode.fill)
            .blur(radius: ViewValues.blurWallpaperLoginView)
            .ignoresSafeArea()
    }
}
