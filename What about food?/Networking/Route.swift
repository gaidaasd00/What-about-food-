//
//  Route.swift
//  What about food?
//
//  Created by Алексей Гайдуков on 01.11.2022.
//

import Foundation

enum Route {
    static let baseURL = "https://yummie.glitch.me"
    
    case fetchAllCategories
    
    var description: String {
        switch self {
        case .fetchAllCategories:
            return "/dish-categories"
        }
    }
}
