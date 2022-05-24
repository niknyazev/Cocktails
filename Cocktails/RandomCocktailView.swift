//
//  RandomCocktailView.swift
//  Cocktails
//
//  Created by Николай on 04.05.2022.
//

import SwiftUI

struct RandomCocktailView: View {
    
    @StateObject var viewModel = RandomCocktailViewModel()
    @State private var dataFetched = false
    
    var body: some View {
        NavigationView {
            VStack {
                CocktailData(viewModel: viewModel)
                Button("Next") {
                    Task {
                        await viewModel.fetchCocktail()
                    }
                }
                .tint(.white)
                .frame(width: 150, height: 50, alignment: .center)
                .background(.red)
                .cornerRadius(20)
                .padding(.bottom, 20)
            }
            .navigationTitle("Random cocktail")
            .task {
                if !dataFetched {
                    await viewModel.fetchCocktail()
                    dataFetched.toggle()
                }
                
            }
        }
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
                .shadow(color: .gray, radius: 3)
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

struct PopUpView: View {
    
    @ObservedObject var viewModel: RandomCocktailViewModel
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

struct CocktailData: View {
    
    @ObservedObject var viewModel: RandomCocktailViewModel
    @State private var showPopUp = false
    
    var body: some View {
        ZStack {
            CocktailDescription(viewModel: viewModel, showPopUp: $showPopUp)
            if showPopUp {
                PopUpView(viewModel: viewModel, showPopUp: $showPopUp)
            }
        }
    }
}

struct CocktailDescription: View {
    
    @ObservedObject var viewModel: RandomCocktailViewModel
    @Binding var showPopUp: Bool
    
    var body: some View {
        VStack {
            Text(viewModel.name)
                .font(.title2)
                .frame(height: 50)
            CocktailImage(isLoading: viewModel.isLoading, image: viewModel.image)
            Button {
                viewModel.favoriteButtonPressed()
            } label: {
                Image(systemName: viewModel.isFavourite ? "bookmark.fill" : "bookmark")
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
