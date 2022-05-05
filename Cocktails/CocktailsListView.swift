//
//  CocktailsListView.swift
//  Cocktails
//
//  Created by Николай on 04.05.2022.
//

import SwiftUI

struct CocktailsListView: View {
    
    let cocktails: [Cocktail_DEMO_REMOVE]
    
    var body: some View {
        List(cocktails) { cocktail in
            HStack {
                VStack {
                    Text(cocktail.name)
                        .font(.title)
                    Text(cocktail.description)
                }
                
                Spacer()
                Image(systemName: cocktail.imageName)
            }
        }
    }
}

struct CocktailsList_Previews: PreviewProvider {
    static var previews: some View {
        CocktailsListView(cocktails: [])
    }
}
