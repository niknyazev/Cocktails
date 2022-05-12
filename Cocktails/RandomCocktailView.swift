//
//  RandomCocktailView.swift
//  Cocktails
//
//  Created by Николай on 04.05.2022.
//

import SwiftUI

struct RandomCocktailView: View {
    
    @StateObject var viewModel = RandomCocktailViewModel()
    
    var body: some View {
        VStack {
            Text(viewModel.name)
            Image("rum_DEMO")
                .resizable()
                .frame(width: 200, height: 200, alignment: .center)
                .cornerRadius(100)
            Button("Next") {
                viewModel.fetchCocktail()
            }
            .font(.title)
        }
    }
}

struct RandomCocktail_Previews: PreviewProvider {
    static var previews: some View {
        RandomCocktailView()
    }
}
