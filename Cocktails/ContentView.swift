//
//  ContentView.swift
//  Cocktails
//
//  Created by Николай on 27.04.2022.
//

import SwiftUI

struct ContentView: View {
    
    struct Cocktail: Identifiable {
        let id = UUID()
        let name: String
        let description: String
        let imageName = "circle"
    }
    
    private let cocktails = [
        Cocktail(name: "vodka", description: "Cool drink"),
        Cocktail(name: "Jin", description: "Not bad, but too expesive"),
        Cocktail(name: "Tequila", description: "Another drink")
    ]
    
    var body: some View {
        List(cocktails) { cocktail in
            HStack {
                VStack {
                    Text(cocktail.name)
                        .font(.title)
                    Text(cocktail.description)
                }
                    
                Spacer()
                Image(systemName: cocktail.imageName)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
