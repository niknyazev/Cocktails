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
    let id: String
    let name: String?
    let category: String?
    let glassName: String?
    let imageUrl: String?
    let thumbUrl: String?
    let instructions: String?
    
    var ingredient1: String? = nil
    var ingredient2: String? = nil
    var ingredient3: String? = nil
    var ingredient4: String? = nil
    var ingredient5: String? = nil
    
    var ingredients: [String] {
        [
            ingredient1,
            ingredient2,
            ingredient3,
            ingredient4,
            ingredient5,
        ]
        .compactMap {
            $0
        }
    }
    
    var imageData: Data?
}

extension Cocktail {
    enum CodingKeys: String, CodingKey {
        case name = "strDrink"
        case category = "strCategory"
        case glassName = "strGlass"
        case imageUrl = "strImageSource"
        case thumbUrl = "strDrinkThumb"
        case instructions = "strInstructions"
        case id = "idDrink"
        
        case ingredient1 = "strIngredient1"
        case ingredient2 = "strIngredient2"
        case ingredient3 = "strIngredient3"
        case ingredient4 = "strIngredient4"
        case ingredient5 = "strIngredient5"
    }
}
