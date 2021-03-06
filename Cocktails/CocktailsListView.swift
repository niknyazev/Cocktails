//
//  CocktailsListView.swift
//  Cocktails
//
//  Created by Николай on 04.05.2022.
//

import SwiftUI

struct CocktailsListView: View {
    
    @StateObject private var viewModel = CocktailsListViewModel()
    @State private var searchText = ""
    
    var body: some View {
        NavigationView {
            VStack {
                if searchText.isEmpty {
                    Text("Enter cocktail name")
                        .font(.title2)
                        .foregroundColor(.gray)
                } else {
                    if viewModel.isLoading {
                        ProgressView()
                            .progressViewStyle(CircularProgressViewStyle(tint: .gray))
                            .scaleEffect(1.5)
                    } else {
                        List(viewModel.cocktails) { cocktail in
                            NavigationLink(
                                destination: CocktailDetailsView(viewModel: cocktail)
                            ) {
                                CocktailRowView(viewModel: cocktail)
                            }
                        }
                    }
                }
            }
            .navigationTitle("Cocktails searcher")
        }
        .searchable(text: $searchText)
        .onChange(of: searchText) { newValue in
            Task {
                await viewModel.fetchCocktails(query: newValue)
            }
        }
    }
}

struct CocktailsList_Previews: PreviewProvider {
    static var previews: some View {
        CocktailsListView()
    }
}
