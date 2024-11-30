//
//  Enums.swift
//  RecipeViewer
//
//  Created by Mikhail Kolkov on 11/29/24.
//

import Foundation

// MARK: - API Endpoints
enum API {
    case primary
    case emptyData
    case invalidData
    
    var url: URL {
        switch self {
        case .primary:
            return URL(string: "https://d3jbb8n5wk0qxi.cloudfront.net/recipes.json")!
        case .emptyData:
            return URL(string: "https://d3jbb8n5wk0qxi.cloudfront.net/recipes-empty.json")!
        case .invalidData:
            return URL(string: "https://d3jbb8n5wk0qxi.cloudfront.net/recipes-malformed.json")!
        }
    }
}

// MARK: - Custom Errors for Recipe Service
enum RecipeServiceError : Error {
    case invalidData
    
    var info: String {
        switch self {
        case .invalidData:
            return "Someting went wrong when fetching recipes"
        }
    }
}
