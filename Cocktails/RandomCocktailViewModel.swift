//
//  RandomCocktailViewModel.swift
//  Cocktails
//
//  Created by Николай on 05.05.2022.
//

import Foundation

class RandomCocktailViewModel: ObservableObject {
    
    @Published var name: String = ""
    @Published var isFavourite: Bool = false
    @Published var instructions: String = ""
    @Published var image: Data? = nil
    @Published var isLoading = false
    
    private var cocktail: Cocktail?
    
    init() {
        fetchCocktail()
    }
    
    func fetchCocktail()  {
        isLoading = true
        CocktailsDataFetcher.shared.randomCocktail { result in
            switch result {
            case .success(let cocktail):
                self.cocktail = cocktail
                self.name = cocktail.name ?? ""
                self.instructions = cocktail.instructions ?? ""
                self.isFavourite = true
                self.image = cocktail.imageData
                self.isLoading = false
            default:
                break
            }
        }
    }
}
