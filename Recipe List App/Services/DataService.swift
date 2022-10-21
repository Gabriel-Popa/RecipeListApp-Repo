//
//  DataService.swift
//  Recipe List App
//
//  Created by Andrei-Gabriel Popa on 17.10.2022.
//

import Foundation

class DataService {
    
    static func getLocalData() -> [Recipe] {
    
        //Parse local json file
        
        //Get a url path to the json file
        
        let recipesPath = Bundle.main.path(forResource: "recipes", ofType: "json")
        
        //Check if recipesPath is not nil, otherwise...
        
        guard recipesPath != nil else{
            return [Recipe]()
        }
            
        //Create url object
            
        let url = URL(fileURLWithPath: recipesPath!)
            
        //Error handling
        
        do {
            
        //Create data object
         
        let data = try Data(contentsOf: url)
        
        //Decode the data with JSON decoder
        
        let decoder = JSONDecoder()
    
            do {
                
                let recipeData = try decoder.decode([Recipe].self, from: data)
        //Add the unique IDs
                
                for r in recipeData {
                    
        //Set a unique ID for each recipe in the recipeData array

                    r.id = UUID()
                    
                    for i in r.ingredients {
                        
                        i.id = UUID()
                    }
                }
                
        //Return the recipes
                return recipeData
            }
            //Error with parsing json

            catch {
                print(error)
            }
                }
        
            //Error with catching data
        catch{
               print(error)
        }
        
        return [Recipe]()
    }
}
