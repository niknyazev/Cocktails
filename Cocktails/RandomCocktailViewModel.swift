//
//  RandomCocktailViewModel.swift
//  Cocktails
//
//  Created by Николай on 05.05.2022.
//

import Foundation

class RandomCocktailViewModel: ObservableObject {
    
    @Published var isLoading = false
    @Published var cocktailDetails: CocktailDetailsViewModel = CocktailDetailsViewModel(cocktail: CocktailsData.getCocktail()) // TODO: Remove
    
    private var cocktail: Cocktail? = nil
    
    @MainActor
    func fetchCocktail() async {
        
        isLoading = true
        
        do {
            
            cocktail = try await CocktailsDataFetcher.shared.randomCocktail()
            
            guard let cocktail = cocktail else {
                return
            }
            
            cocktailDetails = CocktailDetailsViewModel(cocktail: cocktail)
            
            isLoading = false
            
        } catch {
            print(error)
        }
    }
        
}
