//
//  CocktailsApp.swift
//  Cocktails
//
//  Created by Николай on 27.04.2022.
//

import SwiftUI

@main
struct CocktailsApp: App {
    
    @StateObject var colors = Colors()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(colors)
        }
    }
}
