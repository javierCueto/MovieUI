//
//  FieldFormLoadingView.swift
//  MovieUI
//
//  Created by Javier Cueto on 23/08/22.
//

import SwiftUI

struct FieldFormLoadingView: View {
    @Binding var genericField: String
    var textPlaceHolder: String
    var secureField: Bool
    
    var body: some View {
        ZStack(alignment: .leading) {
            if genericField.isEmpty {
                Text(textPlaceHolder)
                    .foregroundColor(.black)
                    .opacity(ViewValues.customPlaceHolderOpacity)
            }
            if secureField {
                SecureField(String(), text: $genericField)
            }else {
                TextField(String(), text: $genericField)
                    .keyboardType(.emailAddress)
            }
        }
        .frame(maxHeight: ViewValues.heightTFB)
        .padding(.horizontal)
        .overlay(
            RoundedRectangle(cornerRadius: ViewValues.cornerRadiusTFB)
                .stroke(Color.black, lineWidth: ViewValues.defaultBorder)
        )
        .padding(.horizontal)
    }
}
