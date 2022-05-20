//
//  CocktailsListViewModel.swift
//  Cocktails
//
//  Created by Николай on 13.05.2022.
//

import Foundation

class CocktailsListViewModel: ObservableObject {
    
    @Published var cocktails: [CocktailDetailsViewModel] = []
    
    func fetchCocktails(query: String) async {
       
        cocktails.removeAll()
        
        let cocktailsData = try? await CocktailsDataFetcher.shared.cocktailData(query: query)
        
        guard let cocktailsData = cocktailsData else {
            return
        }
        
        for cocktail in cocktailsData {
            cocktails.append(CocktailDetailsViewModel(cocktail: cocktail))
        }
        
//        { result in
//            switch result {
//            case .success(let cocktails):
//                for cocktail in cocktails {
//                    self.cocktails.append(CocktailDetailsViewModel(cocktail: cocktail))
//                }
//            default:
//                break
//            }
//        }
    }
}
