//
//  Orders.swift
//  What about food?
//
//  Created by Алексей Гайдуков on 01.11.2022.
//

import Foundation

struct Order: Decodable {
    let id: String?
    let namePerson: String?
    let dish: Dish?
}
