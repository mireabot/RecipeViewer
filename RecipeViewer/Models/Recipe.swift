//
//  Recipe.swift
//  RecipeViewer
//
//  Created by Mikhail Kolkov on 11/28/24.
//

import Foundation

struct Recipe: Codable {
    let uuid: String
    let name: String
    let cuisine: String
    let photo_url_large: String?
    let photo_url_small: String?
    let source_url: String?
    let youtube_url: String?
}
