//
//  ContentView.swift
//  Cocktails
//
//  Created by Николай on 27.04.2022.
//

import SwiftUI

struct ContentView: View {
        
    var body: some View {
        TabView {
            RandomCocktailView()
                .tabItem {
                    Image(systemName: "play.circle")
                        .environment(\.symbolVariants, .none)
                    Text("Random")
                }
            CocktailsListView()
                .tabItem {
                    Image(systemName: "magnifyingglass.circle")
                        .environment(\.symbolVariants, .none)
                    Text("Search")
                }
            FavouriteCocktailsView()
                .tabItem {
                    Image(systemName: "bookmark.circle")
                        .environment(\.symbolVariants, .none)
                    Text("Favorite")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
