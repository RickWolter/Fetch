//
//  MealDetailView.swift
//  Fetch
//
//  Created by Rick W. on 9/23/23.
//

import SwiftUI

struct MealDetailView: View {
    let mealID: String
    @State private var mealDetail: MealDetail?

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text(mealDetail?.strMeal ?? "Loading...").font(.title)
            Text(mealDetail?.strInstructions ?? "")
            // Display Ingredients
        }
        .padding()
        .task {
            do {
                mealDetail = try await APIManager.fetchMealDetails(by: mealID)
            } catch {
                // Handle or show an error message
                print("Error fetching meal details: \(error)")
            }
        }
    }
}
