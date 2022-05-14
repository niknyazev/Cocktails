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
            ZStack {
                getImage(data: viewModel.image)
                    .resizable()
                    .frame(width: 200, height: 200, alignment: .center)
                    .cornerRadius(100)
                if viewModel.isLoading {
                    ProgressView()
                        .progressViewStyle(CircularProgressViewStyle(tint: .white))
                        .scaleEffect(1)
                }
            }
            .offset(y: 20)
            Button {
                print("Its toggle")
            } label: {
                Image(systemName: "bookmark")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 20)
                    .tint(.red)
            }
            .offset(x: 100, y: 20)
            Text(viewModel.instructions)
                .frame(width: 250, height: 200, alignment: .topLeading)
                .offset(y: 30)
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
            .offset(y: -20)
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

struct RandomCocktail_Previews: PreviewProvider {
    static var previews: some View {
        RandomCocktailView(
            viewModel: RandomCocktailViewModel()
        )
    }
}
