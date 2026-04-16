import Foundation
import ParseSwift
import SwiftUI

struct MealPlanResultView: View {
    let mealPlan: MealPlanResponse
    
    var body: some View {
        VStack(alignment: .leading, spacing: 15) {
            Text("Your Meal Plan")
                .font(.title2)
                .bold()
            
            if let meals = mealPlan.meals {
                ForEach(meals) { meal in
                    MealView(meal: meal)
                }
                
                if let nutrients = mealPlan.nutrients {
                    NutrientSummaryView(nutrients: nutrients)
                }
            } else if let week = mealPlan.week {
                ForEach(sortCardsByWeekDay(week), id: \.key) { day, dayMeals in
                    VStack(alignment: .leading, spacing: 10) {
                        Text(formatDay(day))
                            .font(.headline)
                            .padding(.top)
                        
                        ForEach(dayMeals.meals) { meal in
                            MealView(meal: meal)
                        }
                        
                        NutrientSummaryView(nutrients: dayMeals.nutrients)
                    }
                }
            }
        }
        .padding()
        .background(Color.gray.opacity(0.1))
        .cornerRadius(15)
    }
    
    func formatDay(_ day: String) -> String {
        let components = day.split(separator: "y")
        if components.count > 1 {
            return "Day \(components[1])"
        }
        return day.capitalized
    }

    func sortCardsByWeekDay(_ week: [String: MealPlanResponse.DayMeals]) -> [(key: String, MealPlanResponse.DayMeals)] {
        let dayOrder = ["monday", "tuesday", "wednesday", "thursday", "friday", "saturday", "sunday"]
        
        return week.sorted { day1, day2 in
            let index1 = dayOrder.firstIndex(of: day1.key.lowercased()) ?? 999
            let index2 = dayOrder.firstIndex(of: day2.key.lowercased()) ?? 999
            return index1 < index2
        }
        
    }
}
