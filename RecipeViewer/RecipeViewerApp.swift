//
//  RecipeViewerApp.swift
//  RecipeViewer
//
//  Created by Mikhail Kolkov on 11/28/24.
//

import SwiftUI

@main
struct RecipeViewerApp: App {
    private var service = RecipeService(baseURL: API.primary.url)
    var body: some Scene {
        WindowGroup {
            NavigationStack {
                RecipesListView()
                    .environmentObject(RecipeManager(recipeService: service))
            }
        }
    }
}
