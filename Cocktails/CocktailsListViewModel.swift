//
//  CocktailsListViewModel.swift
//  Cocktails
//
//  Created by Николай on 13.05.2022.
//

import Foundation

class CocktailsListViewModel: ObservableObject {
    
    @Published var cocktails: [CocktailRowViewModel] = []
    
    func fetchCocktails(query: String) {
        cocktails.removeAll()
        CocktailsDataFetcher.shared.cocktailData(query: query) { result in
            switch result {
            case .success(let cocktails):
                for cocktail in cocktails {
                    self.cocktails.append(CocktailRowViewModel(cocktail: cocktail))
                }
            default:
                break
            }
        }
    }
}
