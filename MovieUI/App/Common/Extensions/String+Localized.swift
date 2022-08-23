//
//  String+Localized.swift
//  MovieUI
//
//  Created by Javier Cueto on 23/08/22.
//

import Foundation

extension String {
    var localized: String {
        return NSLocalizedString(self, tableName: nil, bundle: Bundle.main, value: "", comment: "")
    }
}
