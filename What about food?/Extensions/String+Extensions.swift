//
//  String+Extensions.swift
//  What about food?
//
//  Created by Алексей Гайдуков on 26.10.2022.
//

import Foundation

extension String {
    var asUrl: URL? {
        return URL(string: self)
    }
}
