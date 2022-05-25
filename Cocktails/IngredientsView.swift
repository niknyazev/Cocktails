//
//  PopUpView.swift
//  Cocktails
//
//  Created by Николай on 25.05.2022.
//

import SwiftUI

struct IngredientsView: View {
    
    var viewModel: CocktailDetailsViewModel
    @Binding var showPopUp: Bool
    
    var body: some View {
        ZStack {
            Rectangle()
                .cornerRadius(15)
                .foregroundColor(.blue)
                .padding(30)
                .shadow(color: .gray, radius: 5)
                .opacity(0.95)
            VStack {
                Text(viewModel.ingredientsTitle)
                    .font(.title2)
                    .foregroundColor(.white)
                    .padding()
                List(viewModel.ingredients) { ingredient in
                    HStack {
                        Text(ingredient.name)
                        Spacer()
                        Text(ingredient.masure)
                    }
                    .foregroundColor(.white)
                    .listRowBackground(Color(white: 0, opacity: 0))
                }
                .listStyle(.plain)
                .padding()
                Spacer()
                Button {
                    showPopUp.toggle()
                } label: {
                    Text("Close")
                        .foregroundColor(.white)
                }
                .padding()
            }.padding(30)
        }
    }
}


struct IngredientsView_Previews: PreviewProvider {
    static var previews: some View {
        IngredientsView(
            viewModel: CocktailDetailsViewModel(
                cocktail: CocktailsData.getCocktail()
            ),
            showPopUp: .constant(true)
        )
    }
}
