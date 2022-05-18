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
                    Image(systemName: "circle")
                    Text("Random")
                }
            CocktailsListView()
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
