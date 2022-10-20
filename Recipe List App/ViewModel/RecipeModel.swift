//
//  RecipeModel.swift
//  Recipe List App
//
//  Created by Andrei-Gabriel Popa on 17.10.2022.
//

import Foundation

class RecipeModel: ObservableObject {
    
    @Published var recipes = [Recipe]()
    
    init() {
        
//        let service = DataService()
//        self.recipes = service.getLocalData()
        
        self.recipes = DataService.getLocalData()
    }
}
