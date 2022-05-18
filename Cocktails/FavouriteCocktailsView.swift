//
//  FavouriteCocktailsView.swift
//  Cocktails
//
//  Created by Николай on 04.05.2022.
//

import SwiftUI

struct FavouriteCocktailsView: View {
    
    @StateObject private var viewModel = FavouriteCocktailsViewModel()
    
    var body: some View {
        NavigationView {
            Group {
                List(viewModel.cocktails) { cocktail in
                    HStack {
                        getImage(data: cocktail.image)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 50)
                            .cornerRadius(25)
                        Text(cocktail.name)
                    }
                }
            }
            .navigationTitle("Favorite cocktails")
        }
    }
    
    // TODO: duplicate
    func getImage(data: Data?) -> Image {
        
        let defaultImage = Image("rum_DEMO")
        
        guard let data = data else {
            return defaultImage
        }
        
        guard let image = UIImage(data: data) else {
            return defaultImage
        }
        return Image(uiImage: image)
    }
    
}

struct FavouriteCocktails_Previews: PreviewProvider {
    static var previews: some View {
        FavouriteCocktailsView()
    }
}
