//
//  RandomCocktailView.swift
//  Cocktails
//
//  Created by Николай on 04.05.2022.
//

import SwiftUI

struct RandomCocktailView: View {
    
    @StateObject var viewModel = RandomCocktailViewModel()
    @EnvironmentObject private var favoriteCocktails: FavouriteCocktailsViewModel
    
    var body: some View {
        NavigationView {
            VStack {
                Text(viewModel.name)
                    .font(.title2)
                    .frame(height: 50)
                CocktailImage(isLoading: viewModel.isLoading, image: viewModel.image)
                Button {
                    favoriteButtonPressed()
                } label: {
                    Image(systemName: viewModel.isFavourite ? "bookmark.fill" : "bookmark")
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
                HStack {
                    Button("Next") {
                        viewModel.fetchCocktail()
                    }
                    .tint(.white)
                    .frame(width: 150, height: 50, alignment: .center)
                    .background(.red)
                    .cornerRadius(20)
                }
                .padding(.bottom, 20)
            }
            .navigationTitle("Random cocktail")
        }
    }
    
    func favoriteButtonPressed() {
        viewModel.favoriteButtonPressed()
        favoriteCocktails.updateFavorite() // TODO: move to MVVM class
    }
}

struct RandomCocktail_Previews: PreviewProvider {
    static var previews: some View {
        RandomCocktailView(
            viewModel: RandomCocktailViewModel()
        )
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
            if isLoading {
                ProgressView()
                    .progressViewStyle(CircularProgressViewStyle(tint: .white))
                    .scaleEffect(1)
            }
        }
    }
    
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
