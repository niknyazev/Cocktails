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
        // TODO: move color to class
        .accentColor(Color(
            red: 251/255,
            green: 86/255,
            blue: 7/255
        ))
        .onAppear() {
            setupBars()
        }
    }
    
    private func setupBars() {
        
        // TODO: move to class
        
        let buttonColor = UIColor(
            red: 251/255,
            green: 86/255,
            blue: 7/255,
            alpha: 1
        )
                
        let textColor: [NSAttributedString.Key : Any] = [.foregroundColor: UIColor.white]
        
        let coloredAppearance = UINavigationBarAppearance()
        coloredAppearance.backgroundColor = buttonColor
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
