//
//  Dish.swift
//  What about food?
//
//  Created by Алексей Гайдуков on 28.10.2022.
//

import Foundation

struct Dish: Decodable {
    let id: String?
    let name: String?
    let description: String?
    let image: String?
    let calories: Int?
    
    var formattedCalories: String {
        return "\(calories ?? 0) calories"
    }
}
