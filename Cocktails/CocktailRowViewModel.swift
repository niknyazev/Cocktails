//
//  CocktailRowViewModel.swift
//  Cocktails
//
//  Created by Николай on 16.05.2022.
//

import Foundation

class CocktailRowViewModel {
    
    var name: String {
        cocktail.name ?? ""
    }
    
    let cocktail: Cocktail
    
    init(cocktail: Cocktail) {
        self.cocktail = cocktail
    }
}
