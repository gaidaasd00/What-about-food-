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
    case placeOrder(String)
    case fetchCategoryDishes(String)
    case fetchOrder
    
    var description: String {
        switch self {
        case .fetchAllCategories:
            return "/dish-categories"
        case .placeOrder(let dishId):
            return "/orders/\(dishId)"
        case .fetchCategoryDishes(let categoryId):
            return "/dishes/\(categoryId)"
        case.fetchOrder:
            return "/orders"
        }
    }
}
