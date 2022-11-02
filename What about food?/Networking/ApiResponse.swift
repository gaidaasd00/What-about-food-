//
//  ApiResponse.swift
//  What about food?
//
//  Created by Алексей Гайдуков on 02.11.2022.
//

import Foundation

struct ApiResponse<T: Decodable>: Decodable {
    let status: Int
    let message: String?
    let data: T?
    let error: String?
}
