//
//  FavouriteCocktailsStorageManager.swift
//  Cocktails
//
//  Created by Николай on 17.05.2022.
//

import Foundation

class FavouriteCocktailsStorageManager {
    
    // MARK: - Properties
    
    static let shared = FavouriteCocktailsStorageManager()
    
    private let userDefaults = UserDefaults.standard
    private let key = "favouriteCocktails"
    
    private init() {}
    
    // MARK: - Public methods
    
    func saveCocktail(cocktailData: Cocktail) {
        
        var cocktails = fetchCocktails()
                
        if (cocktails.first { $0.id == cocktailData.id }) != nil {
            return
        }
        
        cocktails.append(cocktailData)
        
        guard let data = try? JSONEncoder().encode(cocktails) else { return }
        userDefaults.set(data, forKey: key)
    }
    
    func deleteCocktail(id: String) {

        var cocktails = fetchCocktails()
                
        cocktails.removeAll { $0.id == id }
        
        guard let data = try? JSONEncoder().encode(cocktails) else { return }
        userDefaults.set(data, forKey: key)
    }
    
    func fetchCocktails() -> [Cocktail] {
        
        guard let data = userDefaults.data(forKey: key) else {
            return []
        }
        
        guard let result = try? JSONDecoder().decode([Cocktail].self, from: data) else {
            return []
        }
        
        return result
    }
}
