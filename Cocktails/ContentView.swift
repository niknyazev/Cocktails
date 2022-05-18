//
//  ContentView.swift
//  Cocktails
//
//  Created by Николай on 27.04.2022.
//

import SwiftUI

struct ContentView: View {
        
    @StateObject private var favoriteCocktails = FavouriteCocktailsViewModel()
    
    var body: some View {
        TabView {
            RandomCocktailView()
                .environmentObject(favoriteCocktails)
                .tabItem {
                    Image(systemName: "circle")
                    Text("Random")
                }
            CocktailsListView()
                .tabItem {
                    Image(systemName: "circle")
                    Text("Cocktails")
                }
            FavouriteCocktailsView()
                .environmentObject(favoriteCocktails)
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
