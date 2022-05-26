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
    
    func randomCocktail() async throws -> Cocktail? {
        
        let url = urlRandomCocktail()
             
        let cocktails = try await urlDataTask(url: url)
        
        return cocktails.first
    }
            
    func searchCocktails(query: String) async throws -> [Cocktail] {
        
        let queryParameters = queryParameters(query: query)
        let url = urlSearchCocktail(queryItems: queryParameters)
               
        return try await urlDataTask(url: url)
    }
    
    // MARK: - Private methods
    
    private func fetchImageData(from url: String) -> Data? {
        guard let imageURL = URL(string: url) else { return nil }
        guard let imageData = try? Data(contentsOf: imageURL) else { return nil }
        return imageData
    }
    
    private func urlDataTask(url: URL) async throws -> [Cocktail] {
       
        let (data, _) = try await URLSession.shared.data(from: url)
        
        let decoder = JSONDecoder()
        
        guard let cocktailsData = try? decoder.decode(CocktailsNetworkData.self, from: data) else {
            throw NetworkError.decodingError
        }
        
        var result: [Cocktail] = []

        for currentCocktail in cocktailsData.cocktails {
            
            let cocktail = Cocktail(
                id: currentCocktail.id,
                name: currentCocktail.name,
                category: currentCocktail.category,
                glassName: currentCocktail.glassName,
                instructions: currentCocktail.instructions,
                ingredients: currentCocktail.ingredients,
                imageData: fetchImageData(from: currentCocktail.thumbUrl ?? "")
            )
            
            result.append(cocktail)
        }
        
        return result
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

