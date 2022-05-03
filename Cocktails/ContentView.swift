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
            RandomCocktail()
                .tabItem {
                    Image(systemName: "circle")
                    Text("Random")
                }
            CocktailsList(cocktails: cocktails)
                .tabItem {
                    Image(systemName: "circle")
                    Text("Cocktails")
                }
            FavouriteCocktails()
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

struct RandomCocktail: View {
    
    @State private var cocktailName = ""
    private var cocktailsFetcher = CocktailsDataFetcher.shared
    
    var body: some View {
        VStack {
            Text(cocktailName)
            Image("rum_DEMO")
                .resizable()
                .frame(width: 200, height: 200, alignment: .center)
                .cornerRadius(100)
            Button("Next") {
                cocktailsFetcher.randomCocktail { result in
                        switch result {
                        case .success(let cocktail):
                            self.cocktailName = cocktail.drinks.first?.strDrink ?? ""
                        default:
                            print("Its error")
                        }
                }
            }
            .font(.title)
        }
    }
}

struct CocktailsList: View {
    
    let cocktails: [Cocktail_DEMO_REMOVE]
    
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

struct FavouriteCocktails: View {
    var body: some View {
        Text("Favourite")
    }
}
