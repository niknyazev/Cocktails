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
    
    static func getCocktail() -> Cocktail {
        Cocktail(
            id: "001",
            name: "Rum Cola",
            category: "",
            glassName: "",
            imageUrl: nil,
            thumbUrl: nil,
            instructions: "Mix rum and cola",
            ingredient1: "Rum",
            ingredient2: "Cola",
            ingredient3: nil,
            ingredient4: nil,
            ingredient5: nil,
            measure1: "0.5l",
            measure2: "0.5l",
            measure3: nil,
            measure4: nil,
            measure5: nil
        )
    }
}

struct Cocktail: Codable, Identifiable {
    let id: String
    let name: String?
    let category: String?
    let glassName: String?
    let imageUrl: String?
    let thumbUrl: String?
    let instructions: String?
    
    let ingredient1: String?
    let ingredient2: String?
    let ingredient3: String?
    let ingredient4: String?
    let ingredient5: String?
    
    let measure1: String?
    let measure2: String?
    let measure3: String?
    let measure4: String?
    let measure5: String?
    
    var ingredients: [Ingredient] {
        [
            Ingredient(name: ingredient1 ?? "", masure: measure1 ?? ""),
            Ingredient(name: ingredient2 ?? "", masure: measure2 ?? ""),
            Ingredient(name: ingredient3 ?? "", masure: measure3 ?? ""),
            Ingredient(name: ingredient4 ?? "", masure: measure4 ?? ""),
            Ingredient(name: ingredient5 ?? "", masure: measure5 ?? "")
        ]
        .filter {
            !$0.name.isEmpty
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
        
        case measure1 = "strMeasure1"
        case measure2 = "strMeasure2"
        case measure3 = "strMeasure3"
        case measure4 = "strMeasure4"
        case measure5 = "strMeasure5"
        
    }
}

struct Ingredient: Identifiable {
    let id = UUID()
    let name: String
    let masure: String
}

