import Foundation

struct APIManager {
    static let baseFilterURL = "https://themealdb.com/api/json/v1/1/filter.php?c=Dessert"
    static let baseDetailURL = "https://themealdb.com/api/json/v1/1/lookup.php?i="

    static func fetchMeals() async throws -> [Meal] {
        guard let url = URL(string: baseFilterURL) else {
            throw NSError(domain: "Invalid URL", code: 100, userInfo: nil)
        }
        
        let (data, _) = try await URLSession.shared.data(for: URLRequest(url: url))
        let mealsResponse = try JSONDecoder().decode(MealsResponse.self, from: data)
        return mealsResponse.meals.sorted(by: { $0.strMeal < $1.strMeal })
    }

    static func fetchMealDetails(by id: String) async throws -> MealDetail? {
        guard let url = URL(string: baseDetailURL + id) else {
            throw NSError(domain: "Invalid URL", code: 101, userInfo: nil)
        }

        let (data, _) = try await URLSession.shared.data(for: URLRequest(url: url))
        let mealDetailResponse = try JSONDecoder().decode(MealDetailResponse.self, from: data)
        return mealDetailResponse.meals.first
    }
}
