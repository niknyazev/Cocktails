//
//  Cocktail.swift
//  Cocktails
//
//  Created by Николай on 26.05.2022.
//

import Foundation

struct Cocktail: Identifiable, Codable {
    
    let id: String
    let name: String?
    let category: String?
    let glassName: String?
    let instructions: String?
    let ingredients: [Ingredient]
    let imageData: Data?
    
    static func getCocktail() -> Cocktail {
        Cocktail(
            id: "001",
            name: "Cocktail loading...",
            category: "",
            glassName: "",
            instructions: "Cocktail data loading...",
            ingredients: [],
            imageData: nil
        )
    }
    
}

struct Ingredient: Identifiable, Codable {
    var id = UUID()
    let name: String
    let masure: String
}
