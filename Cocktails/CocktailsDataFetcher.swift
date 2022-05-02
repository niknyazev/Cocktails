//
//  CocktailsDataFetcher.swift
//  Cocktails
//
//  Created by Николай on 29.04.2022.
//

import Foundation

enum NetworkError: Error {
    case noData
    case decodingError
}

final class CocktailsDataFetcher {
    
    // MARK: - Properties
    
    static let shared = CocktailsDataFetcher()
    
    private init() {}
    
    // MARK: - Public methods
    
    func request(query: String, completion: @escaping (Result<Cocktail, NetworkError>) -> Void) {
    
        guard let encodingQuery = query.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) else { return }
        
        let queryParameters = queryParameters(query: encodingQuery)
        let url = url(queryItems: queryParameters)
       
        var request = URLRequest(url: url)
        request.allHTTPHeaderFields = queryHeaders()
        request.httpMethod = "get"
        
        URLSession.shared.dataTask(with: request) { (data, _, _) in
                            
            if data == nil {
                DispatchQueue.main.async {
                    completion(.failure(.noData))
                }
                return
            }
            
            let result = JSONWorker.shared.decodeJSON(type: Cocktail.self, from: data)
            
            guard let result = result else {
                DispatchQueue.main.async {
                    completion(.failure(.decodingError))
                }
                return
            }
        
            DispatchQueue.main.async {
                completion(.success(result))
            }
        }.resume()
        
    }
    
    // MARK: - Private methods
    
    // TODO: need to remove
    private func queryHeaders() -> [String: String] {
        var headers: [String: String] = [:]
//        headers["Authorization"] = "Client-ID EENjn6vCuLOltg5kUPDwfubrcy6dvJGOj-SeDQlXoJs"
        return headers
    }
    
    private func queryParameters(query: String) -> [URLQueryItem] {
        let parameters = [
            URLQueryItem(name: "s", value: query)
        ]
        return parameters
    }
    
    private func url(queryItems: [URLQueryItem]) -> URL {
        var components = URLComponents()
        components.scheme = "https"
        components.host = "www.thecocktaildb.com"
        components.path = "/api/json/v1/1/search.php"
        components.queryItems = queryItems
        return components.url!
    }
    
}

