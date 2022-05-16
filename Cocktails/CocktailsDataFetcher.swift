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
    
    private let host = "www.thecocktaildb.com"
    private let scheme = "https"
    
    private init() {}
    
    // MARK: - Public methods
    
    func randomCocktail(completion: @escaping (Result<[Cocktail], NetworkError>) -> Void) {
        
        let url = urlRandomCocktail()
       
        var request = URLRequest(url: url)
        request.httpMethod = "get"
        
        urlDataTask(request: request, completion: completion)
    }
            
    func cocktailData(query: String, completion: @escaping (Result<[Cocktail], NetworkError>) -> Void) {
        
        let queryParameters = queryParameters(query: query)
        let url = urlSearchCocktail(queryItems: queryParameters)
       
        var request = URLRequest(url: url)
        request.httpMethod = "get"
        
        urlDataTask(request: request, completion: completion)
    }
    
    func fetchImageData(from url: String) -> Data? {
        guard let imageURL = URL(string: url) else { return nil }
        guard let imageData = try? Data(contentsOf: imageURL) else { return nil }
        return imageData
    }
    
    // MARK: - Private methods
    
    private func urlDataTask(request: URLRequest, completion: @escaping (Result<[Cocktail], NetworkError>) -> Void) {
        
        URLSession.shared.dataTask(with: request) { (data, _, _) in
                            
            if data == nil {
                DispatchQueue.main.async {
                    completion(.failure(.noData))
                }
                return
            }
            
            let cocktailsData = JSONWorker.shared.decodeJSON(type: CocktailsData.self, from: data)
            
            guard let cocktailsData = cocktailsData else {
                DispatchQueue.main.async {
                    completion(.failure(.decodingError))
                }
                return
            }
            
            var result = cocktailsData.cocktails
            
            for index in 0..<result.count {
                result[index].imageData = self.fetchImageData(from: result[index].thumbUrl ?? "")
            }
                    
            DispatchQueue.main.async {
                completion(.success(result))
            }
        }.resume()
    }
    
    private func queryParameters(query: String) -> [URLQueryItem] {
        let parameters = [
            URLQueryItem(name: "s", value: query)
        ]
        return parameters
    }
    
    private func urlSearchCocktail(queryItems: [URLQueryItem]) -> URL {
        var components = URLComponents()
        components.scheme = scheme
        components.host = host
        components.path = "/api/json/v1/1/search.php"
        components.queryItems = queryItems
        return components.url!
    }
    
    private func urlRandomCocktail() -> URL {
        var components = URLComponents()
        components.scheme = scheme
        components.host = host
        components.path = "/api/json/v1/1/random.php"
        return components.url!
    }
}

