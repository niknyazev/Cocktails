//
//  FavouriteCocktailsStorageManager.swift
//  Cocktails
//
//  Created by Николай on 17.05.2022.
//

import Foundation


struct CocktailStorageData: Codable, Identifiable {
    
    let name: String
    let id: String
    let image: Data?
}

class FavouriteCocktailsStorageManager {
    
    // MARK: - Properties
    
    static let shared = FavouriteCocktailsStorageManager()
    
    private let userDefaults = UserDefaults.standard
    private let key = "favouriteCocktails"
    
    private init() {}
    
    // MARK: - Public methods
    
    func saveCocktail(cocktailData: CocktailStorageData) {
        
        var cocktails = fetchCocktails()
        cocktails.append(cocktailData)
        
        guard let data = try? JSONEncoder().encode(cocktails) else { return }
        userDefaults.set(data, forKey: key)
    }
    
    func fetchCocktails() -> [CocktailStorageData] {
        
        guard let data = userDefaults.data(forKey: key) else {
            return []
        }
        
        guard let result = try? JSONDecoder().decode([CocktailStorageData].self, from: data) else {
            return []
        }
        
        return result
    }
}
