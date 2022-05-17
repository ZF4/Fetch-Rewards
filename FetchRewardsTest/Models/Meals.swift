//
//  Meals.swift
//  FetchRewardsTest
//
//  Created by Zachary Farmer on 5/10/22.
//

import Foundation

//struct for the dictionary that holds all desserts
struct RootData: Codable {
    var meals: [MealDetails]
}
//Struct for ingreditents and measurements
struct Ingredient: Codable {
    var name: String?
    var measure: String?
}

//struct for dessert details of each meal
struct MealDetails: Codable {
    
    var id: String
    var name: String
    var instructions: String?
    var image: String?
    
    var strIngredient1: String?
    var strIngredient2: String?
    var strIngredient3: String?
    var strIngredient4: String?
    var strIngredient5: String?
    var strIngredient6: String?
    var strIngredient7: String?
    var strIngredient8: String?
    var strIngredient9: String?
    var strIngredient10: String?
    var strIngredient11: String?
    var strIngredient12: String?
    var strIngredient13: String?
    var strIngredient14: String?
    var strIngredient15: String?
    var strIngredient16: String?
    var strIngredient17: String?
    var strIngredient18: String?
    var strIngredient19: String?
    var strIngredient20: String?
    
    var strMeasure1: String?
    var strMeasure2: String?
    var strMeasure3: String?
    var strMeasure4: String?
    var strMeasure5: String?
    var strMeasure6: String?
    var strMeasure7: String?
    var strMeasure8: String?
    var strMeasure9: String?
    var strMeasure10: String?
    var strMeasure11: String?
    var strMeasure12: String?
    var strMeasure13: String?
    var strMeasure14: String?
    var strMeasure15: String?
    var strMeasure16: String?
    var strMeasure17: String?
    var strMeasure18: String?
    var strMeasure19: String?
    var strMeasure20: String?
    
    enum CodingKeys: String, CodingKey {
        case id = "idMeal"
        case name = "strMeal"
        case instructions = "strInstructions"
        case image = "strMealThumb"
        
        case strIngredient1, strIngredient2, strIngredient3, strIngredient4, strIngredient5, strIngredient6,
             strIngredient7, strIngredient8, strIngredient9, strIngredient10, strIngredient11, strIngredient12,
             strIngredient13, strIngredient14, strIngredient15, strIngredient16, strIngredient17, strIngredient18,
             strIngredient19, strIngredient20
        
        case strMeasure1, strMeasure2, strMeasure3, strMeasure4, strMeasure5, strMeasure6, strMeasure7, strMeasure8, strMeasure9, strMeasure10, strMeasure11, strMeasure12, strMeasure13, strMeasure14, strMeasure15, strMeasure16, strMeasure17, strMeasure18, strMeasure19, strMeasure20
        }
    
    //Return an array of ing
    func createIngredients() -> [Ingredient] {
        return zip(getAllIngredients(), getAllMeasures()).map {
            if $0.0.isEmpty { print("Cannot get ingredients or measurments") }
            return Ingredient(name: $0.0, measure: $0.1)
        }
    }
        //Put all ingredients into variable to hold them all
        func getAllIngredients() -> [String] {
            var ingredients = [String]()
            
            ingredients.append(strIngredient1 ?? "")
            ingredients.append(strIngredient2 ?? "")
            ingredients.append(strIngredient3 ?? "")
            ingredients.append(strIngredient4 ?? "")
            ingredients.append(strIngredient5 ?? "")
            ingredients.append(strIngredient6 ?? "")
            ingredients.append(strIngredient7 ?? "")
            ingredients.append(strIngredient8 ?? "")
            ingredients.append(strIngredient9 ?? "")
            ingredients.append(strIngredient10 ?? "")
            ingredients.append(strIngredient11 ?? "")
            ingredients.append(strIngredient12 ?? "")
            ingredients.append(strIngredient13 ?? "")
            ingredients.append(strIngredient14 ?? "")
            ingredients.append(strIngredient15 ?? "")
            ingredients.append(strIngredient16 ?? "")
            ingredients.append(strIngredient17 ?? "")
            ingredients.append(strIngredient18 ?? "")
            ingredients.append(strIngredient19 ?? "")
            ingredients.append(strIngredient20 ?? "")
            
            return ingredients.filter{!$0.isEmpty}
        }
    
    //Put all measurements into variable to hold them all
        func getAllMeasures() -> [String] {
            
            var measures = [String]()
            
            measures.append(strMeasure1 ?? "")
            measures.append(strMeasure2 ?? "")
            measures.append(strMeasure3 ?? "")
            measures.append(strMeasure4 ?? "")
            measures.append(strMeasure5 ?? "")
            measures.append(strMeasure6 ?? "")
            measures.append(strMeasure7 ?? "")
            measures.append(strMeasure8 ?? "")
            measures.append(strMeasure9 ?? "")
            measures.append(strMeasure10 ?? "")
            measures.append(strMeasure11 ?? "")
            measures.append(strMeasure12 ?? "")
            measures.append(strMeasure13 ?? "")
            measures.append(strMeasure14 ?? "")
            measures.append(strMeasure15 ?? "")
            measures.append(strMeasure16 ?? "")
            measures.append(strMeasure17 ?? "")
            measures.append(strMeasure18 ?? "")
            measures.append(strMeasure19 ?? "")
            measures.append(strMeasure20 ?? "")
            
            return measures.filter{!$0.isEmpty}
    }
}
