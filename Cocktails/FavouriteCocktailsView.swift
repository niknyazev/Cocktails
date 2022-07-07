//
//  FavoriteCocktailsView.swift
//  Cocktails
//
//  Created by Николай on 04.05.2022.
//

import SwiftUI

struct FavoriteCocktailsView: View {
    
    @StateObject private var viewModel = FavoriteCocktailsViewModel()
    
    var body: some View {
        NavigationView {
            Group {
                List(viewModel.cocktails) { cocktail in
                    NavigationLink(
                        destination: CocktailDetailsView(viewModel: cocktail)
                    ) {
                        HStack {
                            getImage(data: cocktail.image)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 50)
                                .cornerRadius(25)
                            Text(cocktail.name)
                                .offset(x: 10)
                        }
                        .padding(10)
                    }
                }
            }
            .navigationTitle("Favorite cocktails")
            .onAppear(perform: viewModel.updateFavorite)
        }
    }
    
    // TODO: duplicate
    func getImage(data: Data?) -> Image {
        
        let defaultImage = Image("cocktail")
        
        guard let data = data else {
            return defaultImage
        }
        
        guard let image = UIImage(data: data) else {
            return defaultImage
        }
        return Image(uiImage: image)
    }
    
}

struct FavoriteCocktails_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteCocktailsView()
    }
}
