//
//  FavouriteCocktailsViewModel.swift
//  Cocktails
//
//  Created by Николай on 13.05.2022.
//

import Foundation

class FavouriteCocktailsViewModel: ObservableObject {
    
    @Published var cocktails: [CocktailStorageData]
    
    init() {
        cocktails = FavouriteCocktailsStorageManager.shared.fetchCocktails()
    }
    
    
}
