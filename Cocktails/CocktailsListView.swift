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
                } else {
                    List(viewModel.cocktails) { cocktail in
                        HStack {
                            getImage(data: cocktail.image)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 50)
                                .cornerRadius(25)
                            Text(cocktail.name)
                        }
                    }
                }
            }
            .navigationTitle("Cocktails searcher")
        }
        .searchable(text: $searchText)
        .onChange(of: searchText) { newValue in
            viewModel.fetchCocktails(query: newValue)
        }
    }
           
            
    // TODO: duplicate
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

struct CocktailsList_Previews: PreviewProvider {
    static var previews: some View {
        CocktailsListView()
    }
}
