//
//  RandomCocktailView.swift
//  Cocktails
//
//  Created by Николай on 04.05.2022.
//

import SwiftUI

struct RandomCocktailView: View {
    
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

struct RandomCocktail_Previews: PreviewProvider {
    static var previews: some View {
        RandomCocktailView()
    }
}
