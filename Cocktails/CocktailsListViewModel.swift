//
//  CocktailsListViewModel.swift
//  Cocktails
//
//  Created by Николай on 13.05.2022.
//

import Foundation

class CocktailsListViewModel: ObservableObject {
    
    @Published var cocktails: [CocktailDetailsViewModel] = []
    
    @MainActor
    func fetchCocktails(query: String) async {
       
        cocktails.removeAll()
        
        let cocktailsData = try? await CocktailsDataFetcher.shared.searchCocktails(query: query)
        
        guard let cocktailsData = cocktailsData else {
            return
        }
        
        for cocktail in cocktailsData {
            cocktails.append(CocktailDetailsViewModel(cocktail: cocktail))
        }
    }
}
