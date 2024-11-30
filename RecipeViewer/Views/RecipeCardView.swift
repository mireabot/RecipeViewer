//
//  RecipeCardView.swift
//  RecipeViewer
//
//  Created by Mikhail Kolkov on 11/29/24.
//

import SwiftUI
import Kingfisher

struct RecipeCardView: View {
    var recipe: Recipe
    var body: some View {
        VStack(alignment: .leading, spacing: 8, content: {
            VStack(alignment: .leading, spacing: 4, content: {
                Text(recipe.name)
                    .font(.system(.headline, weight: .medium))
                    .foregroundStyle(.primary)
                Text("\(recipe.cuisine) cuisine")
                    .font(.system(.footnote, weight: .regular))
                    .foregroundStyle(.secondary)
            })
            
            if let photoURL = recipe.photo_url_large {
                KFImage(URL(string: photoURL)!)
                    .placeholder {
                        Image(systemName: "arrow.2.circlepath.circle")
                            .font(.largeTitle)
                            .opacity(0.3)
                    }
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(height: 200)
                    .cornerRadius(8)
            } else {
                Rectangle()
                    .frame(height: 200)
                    .cornerRadius(8)
            }
            
            VStack(spacing: 4) {
                if let source = recipe.source_url, let sourceURL = URL(string: source) {
                    RedirectButtonView(icon: Image(systemName: "safari"), title: "Original source", url: sourceURL)
                }
                if let youtube = recipe.youtube_url, let youtubeURL = URL(string: youtube) {
                    RedirectButtonView(icon: Image(systemName: "video"), title: "YouTube video", url: youtubeURL)
                }
            }
        })
        .padding(12)
        .background(RoundedRectangle(cornerRadius: 8).strokeBorder(.tertiary, lineWidth: 1).background(.thinMaterial))
        .cornerRadius(8)
    }
}
