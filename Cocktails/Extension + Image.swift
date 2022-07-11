//
//  Extension + Image.swift
//  Cocktails
//
//  Created by Николай on 11.07.2022.
//

import SwiftUI

extension Image {
    init(cocktailImageData: Data?) {
                
        guard let data = cocktailImageData else {
            self.init("cocktail")
            return
        }
        
        guard let image = UIImage(data: data) else {
            self.init("cocktail")
            return
        }
        
        self.init(uiImage: image)
    }
}
