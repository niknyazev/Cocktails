//
//  Cocktail.swift
//  Cocktails
//
//  Created by Николай on 29.04.2022.
//

import Foundation

struct Cocktail: Decodable {
    let drinks: [Drink]
}

struct Drink: Decodable {
    let strDrink: String
    let strCategory: String
    let strGlass: String
    let strDrinkThumb: String
    let strImageSource: String
    let strIngredient1: String
    let strIngredient2: String
    let strIngredient3: String
    let strIngredient4: String
    let strIngredient5: String
    let strIngredient6: String
    let strIngredient7: String
    let strIngredient8: String
    let strIngredient9: String
}
