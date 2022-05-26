//
//  FavouriteCocktailsViewModel.swift
//  Cocktails
//
//  Created by Николай on 13.05.2022.
//

import Foundation

class FavouriteCocktailsViewModel: ObservableObject {
    
    @Published var cocktails: [CocktailDetailsViewModel] = []
    
    init() {
        updateFavorite()
    }
    
    func updateFavorite() {
        let cocktailsData = FavouriteCocktailsStorageManager.shared.fetchCocktails()
        
        cocktails.removeAll()
        
        cocktailsData.forEach {
            self.cocktails.append(CocktailDetailsViewModel(cocktail: $0))
        }
        
    }
    
}
