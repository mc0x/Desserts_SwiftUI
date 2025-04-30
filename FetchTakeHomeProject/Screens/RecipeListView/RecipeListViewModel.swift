//
//  RecipeListViewModel.swift
//  FetchTakeHomeProject
//
//  Created by Mayra Cortez on 1/13/25.
//

import SwiftUI

@MainActor final class RecipeListViewModel: ObservableObject {
    @Published var recipes: [Recipe] = []
    @Published var alertItem: AlertItem?
    @Published var isLoading = false
    @Published var isShowingDetail = false
    @Published var selectedRecipe: Recipe?

    func getRecipes() {
        isLoading = true
        
        Task {
            do {
                recipes = try await NetworkManager.shared.getRecipes()
                isLoading = false
            } catch {
                if let recipeError = error as? RecipeError {
                    switch recipeError {
                        case .invalidURL:
                            alertItem = AlertContext.invalidURL
                        case .invalidResponse:
                            alertItem = AlertContext.invalidResponse
                        case .invalidData:
                            alertItem = AlertContext.invalidData
                        case .unableToComplete:
                            alertItem = AlertContext.unableToComplete
                    }
                } else {
                    alertItem = AlertContext.invalidResponse
                }
                isLoading = true
            }
        }
    }
}
