//
//  ContentView.swift
//  RecipeViewer
//
//  Created by Mikhail Kolkov on 11/28/24.
//

import SwiftUI
import Kingfisher

struct RecipesListView: View {
    @EnvironmentObject private var recipeManager: RecipeManager
    @State private var isRefreshing: Bool = false
    var body: some View {
        ScrollView {
            LazyVStack(spacing: 16) {
                if isRefreshing {
                    ForEach(0..<5, id: \.self) { _ in
                        RecipePlaceholderView()
                    }
                } else if let error = recipeManager.error {
                    WarningBannerView(
                        icon: Image(systemName: "exclamationmark.triangle"),
                        title: "Failed to Load Recipes",
                        text: error.info
                    )
                } else if recipeManager.recipes.isEmpty {
                    WarningBannerView(
                        icon: Image(systemName: "tray"),
                        title: "No Recipes Available",
                        text: "Pull down to refresh and fetch new recipes"
                    )
                }
                else {
                    ForEach(recipeManager.recipes, id: \.name) { recipe in
                        RecipeCardView(recipe: recipe)
                            .id(recipe.uuid)
                    }
                }
            }
            .padding(16)
        }
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .principal) {
                VStack(alignment: .center, spacing: 2) {
                    Text("Recipes")
                        .font(.system(.headline, weight: .bold))
                        .foregroundStyle(.primary)
                    Text("\(recipeManager.recipes.count) recipes available")
                        .font(.system(.footnote, weight: .regular))
                        .foregroundStyle(.secondary)
                }
            }
            ToolbarItem(placement: .topBarTrailing) {
                Button(action: {getRecipes()}, label: {
                    Image(systemName: "arrow.circlepath")
                        .foregroundStyle(.primary)
                })
            }
        }
        .onAppear(perform: {
            getRecipes()
        })
        .refreshable {
            getRecipes()
        }
    }
    
    private func getRecipes() {
        isRefreshing = true
        Task {
            do {
                try await recipeManager.getAllRecipes()
            }
            isRefreshing = false
        }
    }
}

#Preview {
    NavigationStack {
        RecipesListView()
            .environmentObject(RecipeManager(recipeService: RecipeService(baseURL: API.primary.url)))
    }
}
