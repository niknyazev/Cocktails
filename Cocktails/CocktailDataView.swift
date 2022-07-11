//
//  CocktailDataView.swift
//  Cocktails
//
//  Created by Николай on 25.05.2022.
//

import SwiftUI

struct CocktailDataView: View {
    
    @ObservedObject var viewModel: CocktailDetailsViewModel
    let isLoading: Bool
    
    @State private var showPopUp = false
    
    var body: some View {
        ZStack {
            CocktailDescription(
                viewModel: viewModel,
                isLoading: isLoading,
                showPopUp: $showPopUp
            )
            if showPopUp {
                IngredientsView(viewModel: viewModel, showPopUp: $showPopUp)
            }
        }
    }
}

struct CocktailImage: View {
    
    let isLoading: Bool
    let image: Data?
    
    var body: some View {
        ZStack {
            Image(cocktailImageData: image)
                .resizable()
                .frame(width: 200, height: 200, alignment: .center)
                .cornerRadius(100)
                .shadow(color: .gray, radius: 3)
            if isLoading {
                ProgressView()
                    .progressViewStyle(CircularProgressViewStyle(tint: .white))
                    .scaleEffect(1.5)
            }
        }
    }
}

struct CocktailDescription: View {
    
    @ObservedObject var viewModel: CocktailDetailsViewModel
    let isLoading: Bool
    
    @Binding var showPopUp: Bool
    
    var body: some View {
        VStack {
            CocktailImage(isLoading: isLoading, image: viewModel.image)
                .padding(.top, 30)
            Button {
                viewModel.favoriteButtonPressed()
            } label: {
                Image(systemName: viewModel.isFavorite ? "heart.fill" : "heart")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 20)
                    .tint(.red)
            }
            .offset(x: 100)
            VStack(alignment: .leading, spacing: 20) {
                Text(viewModel.name)
                    .font(.title3)
                Text(viewModel.instructions)
                    .foregroundColor(.gray)
                Button {
                    showPopUp.toggle()
                } label: {
                    Text(viewModel.ingredientsTitle)
                }
            }
            .padding(.top, 10)
            .frame(width: 300, alignment: .leading)
            Spacer()
        }
    }
}

struct CocktailDataView_Previews: PreviewProvider {
    static var previews: some View {
        CocktailDataView(
            viewModel: CocktailDetailsViewModel(
                cocktail: Cocktail.getCocktail()
            ),
            isLoading: false
        )
    }
}
