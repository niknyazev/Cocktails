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
            
//            isFavourite = FavouriteCocktailsStorageManager
//                .shared
//                .fetchCocktails()
//                .first { $0.id == self.cocktail?.id ?? "" } != nil
            
            isLoading = false
            
        } catch {
            print(error)
        }
    }
        
//    func favoriteButtonPressed() {
//        isFavourite.toggle()
//
//        if isFavourite {
//            saveFavouriteStatus()
//        } else {
//            removeFavouriteStatus()
//        }
//    }
    
    func saveFavouriteStatus() {
        
        guard let cocktail = cocktail else { return }
        
        FavouriteCocktailsStorageManager.shared.saveCocktail(
            cocktailData: CocktailStorageData(
                name: cocktail.name ?? "",
                id: cocktail.id,
                image: cocktail.imageData
            )
        )
    }
    
    func removeFavouriteStatus() {

        guard let cocktail = cocktail else { return }
        
        FavouriteCocktailsStorageManager.shared.deleteCocktail(id: cocktail.id)
    }
}
