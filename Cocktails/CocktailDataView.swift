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
            getImage(data: image)
                .resizable()
                .frame(width: 200, height: 200, alignment: .center)
                .cornerRadius(100)
                .shadow(color: .gray, radius: 3)
            if isLoading {
                ProgressView()
                    .progressViewStyle(CircularProgressViewStyle(tint: .white))
                    .scaleEffect(1)
            }
        }
    }
    
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

struct CocktailDescription: View {
    
    @ObservedObject var viewModel: CocktailDetailsViewModel
    let isLoading: Bool
    
    @Binding var showPopUp: Bool
    
    var body: some View {
        VStack {
            Text(viewModel.name)
                .font(.title2)
                .frame(height: 50)
            CocktailImage(isLoading: isLoading, image: viewModel.image)
            Button {
                viewModel.favoriteButtonPressed()
            } label: {
                Image(systemName: viewModel.isFavorite ? "bookmark.fill" : "bookmark")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 20)
                    .tint(.red)
            }
            .offset(x: 100)
            VStack(alignment: .leading, spacing: 20) {
                Text(viewModel.instructions)
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
