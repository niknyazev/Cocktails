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
        VStack {
            CocktailImage(isLoading: false, image: viewModel.image)
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
            Text(viewModel.instructions)
                .frame(width: 300, height: 200, alignment: .topLeading)
                .padding(.top, 20)
            Spacer()
        }
        .padding(10)
        .navigationTitle(viewModel.name)
    }
}

struct CocktailDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        CocktailDetailsView(
            viewModel: CocktailDetailsViewModel(
                cocktail: Cocktail(
                    id: "0001",
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
