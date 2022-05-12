//
//  RandomCocktailViewModel.swift
//  Cocktails
//
//  Created by Николай on 05.05.2022.
//

import Foundation

class RandomCocktailViewModel: ObservableObject {
    
    @Published var name: String = ""
    
    private var cocktail: Cocktail?
    
    init() {
        fetchCocktail()
    }
    
    func fetchCocktail()  {
        CocktailsDataFetcher.shared.randomCocktail { result in
            switch result {
            case .success(let cocktail):
                self.cocktail = cocktail
                self.name = cocktail.name ?? ""
            default:
                break
            }
        }
    }
}
