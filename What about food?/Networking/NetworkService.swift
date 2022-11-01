//
//  NetworkService.swift
//  What about food?
//
//  Created by Алексей Гайдуков on 01.11.2022.
//

import Foundation

struct NetworkService {
    ///  Помогает сгенерировать урл запрос
    /// - Parameters:
    ///   - route: путь к ресурсу в бэке
    ///   - method: тип отправляемого запроса и параметры
    ///   - parameters: любую информацию передавайте на серверную часть
    /// - Returns: URLRequest
    private func createRequest(route: Route, method: Method, parameters: [String: Any]? = nil) -> URLRequest? {
        let urlString = Route.baseURL + route.description
        guard let url = urlString.asUrl else { return nil }
        var urlRequest = URLRequest(url: url)
        urlRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
        urlRequest.httpMethod = method.rawValue
        
        if let param = parameters {
            switch method {
            case .get:
                var urlComponent = URLComponents(string: urlString)
                urlComponent?.queryItems = param.map { URLQueryItem(name: $0, value: "\($1)") }
                urlRequest.url = urlComponent?.url
            case .post, .delete, .patch:
                let bodyData  = try? JSONSerialization.data(withJSONObject: param)
                urlRequest.httpBody = bodyData
            }
        }
        return urlRequest
    }
}
