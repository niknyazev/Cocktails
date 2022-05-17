//
//  CocktailRowViewModel.swift
//  Cocktails
//
//  Created by Николай on 16.05.2022.
//

import Foundation

class CocktailDetailsViewModel: Identifiable {
    
    var name: String {
        cocktail.name ?? ""
    }
    
    var image: Data? {
        cocktail.imageData
    }
    
    var instructions: String {
        cocktail.instructions ?? ""
    }
    
    let cocktail: Cocktail
    
    init(cocktail: Cocktail) {
        self.cocktail = cocktail
    }
}
