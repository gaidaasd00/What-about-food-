//
//  AllDishes.swift
//  What about food?
//
//  Created by Алексей Гайдуков on 02.11.2022.
//

import Foundation

struct AllDishes: Decodable {
    let categories: [DishCategory]?
    let populars: [Dish]?
    let specials: [Dish]?
    
}
