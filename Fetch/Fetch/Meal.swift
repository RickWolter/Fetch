//
//  Meal.swift
//  Fetch
//
//  Created by Rick W. on 9/23/23.
//

import Foundation

// Model for list view
struct MealsResponse: Codable {
    let meals: [Meal]
}

struct Meal: Codable, Identifiable {
    let idMeal: String
    let strMeal: String
    let strMealThumb: String
  
  var id: String {
        return idMeal
    }
}

// Model for detail view
struct MealDetailResponse: Codable {
    let meals: [MealDetail]
}

struct MealDetail: Codable {
    let strMeal: String
    let strInstructions: String
    let strIngredient1: String?
    let strIngredient2: String?
    // ... and so on until strIngredient20
    // Similarly, fetch measurements. You can further optimize the model based on the API response.
}

