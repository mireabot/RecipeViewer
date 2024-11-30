//
//  RecipeManager.swift
//  RecipeViewer
//
//  Created by Mikhail Kolkov on 11/29/24.
//

import SwiftUI

@MainActor
class RecipeManager: ObservableObject {
    @Published var recipes: [Recipe] = []
    @Published var error: RecipeServiceError?
    
    let recipeService: RecipeService
    
    init(recipeService: RecipeService) {
        self.recipeService = recipeService
    }
    
    func getAllRecipes() async throws {
        do {
            let recipes = try await recipeService.getAllRecipes()
            print("Fetched recipes: \(recipes)")
            self.recipes = recipes
        } catch {
            print("Error fetching recipes: \(error.localizedDescription)")
            self.error = .invalidData
        }
    }
}
