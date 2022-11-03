//
//  NetworkService.swift
//  What about food?
//
//  Created by Алексей Гайдуков on 01.11.2022.
//

import Foundation

struct NetworkService {
    
    static let shared = NetworkService()
    private init() {}
  
    func fetchAllCategories(completion: @escaping(Result<AllDishes, Error>) -> Void) {
        request(route: .fetchAllCategories, method: .get, completion: completion)
    }
    
    func placeOrder(
        dishID: String,
        name: String,
        completion: @escaping (Result<Order, Error> ) -> Void
    ) {
        let param = ["name": name]
        request(
            route: .placeOrder(dishID),
            method: .post,
            parameters: param, 
            completion: completion
        )
    }
    
    func fetchCategoryDishes(
        categoryId: String,
        completion: @escaping(Result<[Dish], Error>) -> Void
    ) {
        request(route: .fetchCategoryDishes(categoryId), method: .get, completion: completion)
    }
    
    func fetchOrders(completion: @escaping (Result<[Order], Error>) -> Void) {
        request(route: .fetchOrder, method: .get, completion: completion)
    }
    
    private func request<T: Decodable>(
        route: Route,
        method: Method,
        parameters: [String: Any]? = nil,
        completion: @escaping (Result<T, Error>) -> Void) {
        
            guard let request = createRequest(
                route: route,
                method: method,
                parameters: parameters
            ) else {
                completion(.failure(AppError.unknownError))
                return
            }
            
            URLSession.shared.dataTask(with: request) {  data, response, error in
                var result: Result<Data, Error>?
                if let data = data {
                    result = .success(data)
                    let responseString = String(data: data, encoding: .utf8) ?? "Could not string our data"
                    print("The response is: \(responseString)")
                } else if let error = error {
                    result = .failure(error)
                    print("The error is: \(error.localizedDescription)")
                }
                DispatchQueue.main.async {
                    // TODO: decode our result and sent back to the user
                    self.handleResponse(result: result, completion: completion)
                }
            }.resume()
    }
    
    private func handleResponse<T: Decodable>(result: Result<Data, Error>?, completion: (Result<T, Error>) -> Void) {
        guard let result = result else {
            completion(.failure(AppError.unknownError))
            return
        }
        switch result {
        case .success(let data):
            let decoder = JSONDecoder()
            guard let response = try? decoder.decode(ApiResponse<T>.self, from: data) else {
                completion(.failure(AppError.errorDecoding))
                return
            }
            if let error = response.error {
                completion(.failure(AppError.serverError(error)))
                return
            }
            if let decodedData = response.data {
                completion(.success(decodedData))
            } else {
                completion(.failure(AppError.errorDecoding))
            }
        case .failure(let error):
            completion(.failure(error))
        }
    }
    
    
    
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
