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
            Image(cocktailImageData: viewModel.image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 50)
                .cornerRadius(25)
            Text(viewModel.name)
            Spacer()
            Image(systemName: viewModel.isFavorite ? "heart.fill" : "heart")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 15)
                .foregroundColor(viewModel.isFavorite ? .red : .gray)
                .padding()
        }
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
