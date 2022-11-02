//
//  DishCategory.swift
//  What about food?
//
//  Created by Алексей Гайдуков on 26.10.2022.
//

import Foundation

struct DishCategory: Decodable {
    let id: String?
    let name: String?
    let image: String?
    
    enum CodingKeys: String, CodingKey {
        case id
        case name = "title"
        case image
    }
}
