//
//  CocktailDetailsView.swift
//  Cocktails
//
//  Created by Николай on 17.05.2022.
//

import SwiftUI

struct CocktailDetailsView: View {
    
    let viewModel: CocktailRowViewModel
    
    var body: some View {
        VStack {
//            CocktailImage(isLoading: viewModel.isLoading, image: viewModel.image)
            Button {
                print("Its toggle")
            } label: {
                Image(systemName: "bookmark")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 20)
                    .tint(.red)
            }
            .offset(x: 100)
            Spacer()
//            Text(viewModel.instructions)
//                .frame(width: 300, height: 200, alignment: .topLeading)
//                .offset(y: 30)
        }
        .navigationTitle(viewModel.name)
    }
}

struct CocktailDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        CocktailDetailsView(
            viewModel: CocktailRowViewModel(
                cocktail: Cocktail(
                    name: "Gin",
                    category: nil,
                    glassName: nil,
                    imageUrl: nil,
                    thumbUrl: nil,
                    instructions: nil
                )
            )
        )
    }
}
