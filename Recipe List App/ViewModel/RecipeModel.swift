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
    
    static func getPortion(ingredient:Ingredient, recipeServings:Int, targetServings:Int) -> String {
        
        var portion = ""
        var numerator = ingredient.num ?? 1
        var denumerator = ingredient.denom ?? 1
        var wholePortions = 0
        
        if ingredient.num != nil {
            
            //Get a single serving size by multiplying denominator by the recipe servings
            denumerator *= recipeServings
            
            //Get target portion by multiplying numerator by target servings
            numerator *= targetServings
            
            //Reduce fraction by greatest common divisor
            let divisior = Rational.greatestCommonDivisor(numerator, denumerator)
            numerator /= divisior
            denumerator /= divisior
            //Get the whole portion if numerator > denumerator
            if numerator >= denumerator {
                
                //Calculated the whole portions
                wholePortions = numerator / denumerator
                
                //Calculate the remainder
                numerator = numerator % denumerator
                
                //Assign to portion string
                portion += String(wholePortions)
            }
            
            //Express the remainder as a fraction
            
            if numerator > 0 {
                
                //Assign remainder as fraction to the portion string
                portion += wholePortions > 0 ? " " : ""
                portion += "\(numerator)/\(denumerator)"
            }
        }
        
        if var unit = ingredient.unit {
            
            //If we need to pluralize
            if wholePortions > 1 {
                //Calculate appropriate suffix
                
                if unit.suffix(20) == "ch" {
                    unit += "es"
                }
                else if unit.suffix(1) == "f" {
                    unit = String(unit.dropLast())
                    unit += "ves"
                }
                else {
                    unit += "s"
                }
            }
            
            portion += ingredient.num == nil && ingredient.denom == nil ? "" : " "
                
            return portion + unit
        }
            return portion
    }
}
