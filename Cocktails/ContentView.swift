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
                    Text("Random")
                }
            CocktailsListView()
                .tabItem {
                    Image(systemName: "magnifyingglass.circle")
                    Text("Search")
                }
            FavoriteCocktailsView()
                .tabItem {
                    Image(systemName: "bookmark.circle")
                    Text("Favorite")
                }
        }
        .onAppear() {
            setupBars()
        }
    }
    
    private func setupBars() {
        
        // Tab bar
        
        let appearanceTabBar = UITabBar.appearance()
        
        appearanceTabBar.backgroundColor = .red
        appearanceTabBar.unselectedItemTintColor = .white

        // Navigation bar
        
        let textColor: [NSAttributedString.Key : Any] = [.foregroundColor: UIColor.white]
        
        let coloredAppearance = UINavigationBarAppearance()
        coloredAppearance.backgroundColor = .red
        coloredAppearance.titleTextAttributes = textColor
        coloredAppearance.largeTitleTextAttributes = textColor

        let appearanceNavigationBar = UINavigationBar.appearance()
            
        appearanceNavigationBar.standardAppearance = coloredAppearance
        appearanceNavigationBar.compactAppearance = coloredAppearance
        appearanceNavigationBar.scrollEdgeAppearance = coloredAppearance        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
