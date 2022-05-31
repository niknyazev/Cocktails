//
//  CocktailRowViewModel.swift
//  Cocktails
//
//  Created by Николай on 16.05.2022.
//

import Foundation

protocol CocktailDetailsProtocol {
    
    var name: String { get }
    var image: Data? { get }
    var instructions: String { get }
    var isFavorite: Bool { get }
    var ingredientsTitle: String { get }
    var ingredients: [Ingredient] { get }
    
    func favoriteButtonPressed()
    
}

class CocktailDetailsViewModel: Identifiable, CocktailDetailsProtocol, ObservableObject {

    @Published var isFavorite: Bool
    
    var name: String {
        cocktail.name ?? ""
    }
    
    var image: Data? {
        cocktail.imageData
    }
    
    var instructions: String {
        cocktail.instructions ?? ""
    }
    
    var ingredientsTitle: String {
        "Ingredients (\(cocktail.ingredients.count))"
    }
    
    var ingredients: [Ingredient] {
        cocktail.ingredients
    }
   
    private let cocktail: Cocktail
    
    init(cocktail: Cocktail) {
       
        self.cocktail = cocktail
        
        isFavorite = FavoriteCocktailsStorageManager
            .shared
            .fetchCocktails()
            .first { $0.id == cocktail.id} != nil
    }
    
    func favoriteButtonPressed() {
        
        if isFavorite {
            removeFavoriteStatus()
        } else {
            saveFavoriteStatus()
        }
        
        isFavorite.toggle()
    }
    
    private func saveFavoriteStatus() {
        FavoriteCocktailsStorageManager.shared.saveCocktail(cocktailData: cocktail)
    }
    
    private func removeFavoriteStatus() {
        FavoriteCocktailsStorageManager.shared.deleteCocktail(id: cocktail.id)
    }
    
}
