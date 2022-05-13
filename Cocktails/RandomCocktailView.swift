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
                .font(.title2)
                .offset(y: 20)
                .frame(height: 50)
            Image("rum_DEMO")
                .resizable()
                .frame(width: 200, height: 200, alignment: .center)
                .cornerRadius(100)
                .offset(y: 20)
            Spacer()
            Button("Next") {
                viewModel.fetchCocktail()
            }
            .tint(.white)
            .frame(width: 150, height: 50, alignment: .center)
            .background(.red)
            .cornerRadius(20)
            .offset(y: -20)
        }
    }
}

struct RandomCocktail_Previews: PreviewProvider {
    static var previews: some View {
        RandomCocktailView()
    }
}
