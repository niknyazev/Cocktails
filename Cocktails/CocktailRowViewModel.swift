//
//  CocktailRowViewModel.swift
//  Cocktails
//
//  Created by Николай on 16.05.2022.
//

import Foundation

class CocktailRowViewModel: Identifiable {
    
    var name: String {
        cocktail.name ?? ""
    }
    
    var image: Data? {
        cocktail.imageData
    }
    
    let cocktail: Cocktail
    
    init(cocktail: Cocktail) {
        self.cocktail = cocktail
    }
}
