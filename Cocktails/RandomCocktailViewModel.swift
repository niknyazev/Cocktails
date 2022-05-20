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
    
    private var cocktail: Cocktail? = nil
    
    @MainActor
    func fetchCocktail() async {
        
        isLoading = true
        
        do {
            
            let cocktails = try await CocktailsDataFetcher.shared.randomCocktail()
            
            guard let cocktailData = cocktails.first else {
                return
            }
            name = cocktailData.name ?? ""
            instructions = cocktailData.instructions ?? ""
            image = cocktailData.imageData
            
            isFavourite = FavouriteCocktailsStorageManager
                .shared
                .fetchCocktails()
                .first { $0.id == self.cocktail?.id ?? "" } != nil
            
            isLoading = false
            
        } catch {
            print(error)
        }
    }
    
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
    
    func favoriteButtonPressed() {
        isFavourite.toggle()
        saveFavouriteStatus()
    }
    
}
