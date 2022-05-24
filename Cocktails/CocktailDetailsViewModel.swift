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
    var isFavourite: Bool { get }
    var ingredientsTitle: String { get }
    var ingredients: [Ingredient] { get }
    
    func favoriteButtonPressed()
    
}

class CocktailDetailsViewModel: Identifiable, CocktailDetailsProtocol {

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
    
    func favoriteButtonPressed() {
        print("Pressed")
    }
    
    var isFavourite = false
    
    private let cocktail: Cocktail
    
    init(cocktail: Cocktail) {
        self.cocktail = cocktail
    }
}
