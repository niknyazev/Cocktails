//
//  CocktailRowView.swift
//  Cocktails
//
//  Created by Николай on 17.05.2022.
//

import SwiftUI

struct CocktailRowView: View {
    
    let viewModel: CocktailDetailsViewModel
    
    var body: some View {
        HStack {
            getImage(data: viewModel.image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 50)
                .cornerRadius(25)
            Text(viewModel.name)
            Spacer()
            Image(systemName: viewModel.isFavorite ? "bookmark.fill" : "bookmark")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 15)
                .foregroundColor(.red)
                .padding()
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

struct CocktailRowView_Previews: PreviewProvider {
    static var previews: some View {
        CocktailRowView(
            viewModel: CocktailDetailsViewModel(
                cocktail: Cocktail.getCocktail()
            )
        )
    }
}
