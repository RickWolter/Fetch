//
//  MealsListView.swift
//  Fetch
//
//  Created by Rick W. on 9/24/23.
//

import SwiftUI

struct MealsListView: View {
    @State private var meals: [Meal] = []

    var body: some View {
        NavigationView {
            List(meals) { meal in
                NavigationLink(destination: MealDetailView(mealID: meal.id)) {
                    Text(meal.strMeal)
                }
            }
            .task {
                do {
                    meals = try await APIManager.fetchMeals()
                } catch {
                    // Handle or show an error message
                    print("Error fetching meals: \(error)")
                }
            }
            .navigationBarTitle("Desserts")
        }
    }
}
