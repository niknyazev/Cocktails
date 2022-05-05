//
//  ContentView.swift
//  Cocktails
//
//  Created by Николай on 27.04.2022.
//

import SwiftUI

struct Cocktail_DEMO_REMOVE: Identifiable {
    let id = UUID()
    let name: String
    let description: String
    let imageName = "circle"
}

struct ContentView: View {
        
    private let cocktails = [
        Cocktail_DEMO_REMOVE(name: "vodka", description: "Cool drink"),
        Cocktail_DEMO_REMOVE(name: "Jin", description: "Not bad, but too expesive"),
        Cocktail_DEMO_REMOVE(name: "Tequila", description: "Another drink")
    ]
    
    var body: some View {
        TabView {
            RandomCocktailView()
                .tabItem {
                    Image(systemName: "circle")
                    Text("Random")
                }
            CocktailsListView(cocktails: cocktails)
                .tabItem {
                    Image(systemName: "circle")
                    Text("Cocktails")
                }
            FavouriteCocktailsView()
                .tabItem {
                    Image(systemName: "circle")
                    Text("Favourite")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
