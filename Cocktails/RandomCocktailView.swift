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
                CocktailDataView(viewModel: viewModel.cocktailDetails)
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
