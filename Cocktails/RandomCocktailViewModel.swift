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
    
    func fetchCocktail() async {
        isLoading = true
        
        do {
            let cocktails = try await CocktailsDataFetcher.shared.randomCocktail()
            guard let cocktail = cocktails.first else {
                return
            }
            self.cocktail = cocktail
        } catch {
            print(error)
        }
        
//        CocktailsDataFetcher.shared.randomCocktail { result in
//            switch result {
//            case .success(let cocktails):
//
//                guard let cocktail = cocktails.first else {
//                    return
//                }
//
//                self.cocktail = cocktail
//                self.name = cocktail.name ?? ""
//                self.instructions = cocktail.instructions ?? ""
//                self.isFavourite = true
//                self.image = cocktail.imageData
//                self.isLoading = false
//
//                self.isFavourite = FavouriteCocktailsStorageManager
//                    .shared
//                    .fetchCocktails()
//                    .first { $0.id == self.cocktail?.id ?? "" } != nil
//            default:
//                break
//            }
//        }
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
