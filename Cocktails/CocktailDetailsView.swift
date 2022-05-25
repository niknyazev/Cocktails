//
//  CocktailDetailsView.swift
//  Cocktails
//
//  Created by Николай on 17.05.2022.
//

import SwiftUI

struct CocktailDetailsView: View {
    
    let viewModel: CocktailDetailsViewModel
    
    var body: some View {
        CocktailDataView(viewModel: viewModel, isLoading: false)
            .navigationTitle(viewModel.name)
    }
}

struct CocktailDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        CocktailDetailsView(
            viewModel: CocktailDetailsViewModel(
                cocktail: CocktailsData.getCocktail()
            )
        )
    }
}
