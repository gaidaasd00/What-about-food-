//
//  UserDefaults+Extension.swift
//  What about food?
//
//  Created by Алексей Гайдуков on 06.11.2022.
//

import Foundation

extension UserDefaults {
    private enum UserDefaultsKeys: String {
        case hasOnboarding
    }
    var hasOnboarded: Bool {
        get {
            bool(forKey: UserDefaultsKeys.hasOnboarding.rawValue)
        } set {
            setValue(newValue, forKey: UserDefaultsKeys.hasOnboarding.rawValue)
        }
    }
}
