//
//  Recipe.swift
//  Recipe List App
//
//  Created by Andrei-Gabriel Popa on 17.10.2022.
//

import Foundation
import UIKit

class Recipe: Identifiable, Decodable {
    
    var id:UUID?
    var name:String
    var featured:Bool
    var image:String
    var description:String
    var prepTime:String
    var cookTime:String
    var servings:Int
    var ingredients:[Ingredient]
    var directions:[String]
    var highlights:[String]
}

class Ingredient: Identifiable, Decodable {
    
    var id:UUID?
    var name:String
    var num:Int?
    var denom:Int?
    var unit:String?
}
