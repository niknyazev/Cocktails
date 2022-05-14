//
//  Cocktail.swift
//  Cocktails
//
//  Created by Николай on 29.04.2022.
//

import Foundation

struct CocktailsData: Decodable {
    let cocktails: [Cocktail]
    
    enum CodingKeys: String, CodingKey {
        case cocktails = "drinks"
    }
}

struct Cocktail: Decodable {
    let name: String?
    let category: String?
    let glassName: String?
    let imageUrl: String?
    let thumbUrl: String?
    let instructions: String?
    var imageData: Data?
//    let strIngredient1: String?
//    let strIngredient2: String?
//    let strIngredient3: String?
//    let strIngredient4: String?
//    let strIngredient5: String?
//    let strIngredient6: String?
//    let strIngredient7: String?
//    let strIngredient8: String?
//    let strIngredient9: String?

    enum CodingKeys: String, CodingKey {
        case name = "strDrink"
        case category = "strCategory"
        case glassName = "strGlass"
        case imageUrl = "strImageSource"
        case thumbUrl = "strDrinkThumb"
        case instructions = "strInstructions"
    }
}
