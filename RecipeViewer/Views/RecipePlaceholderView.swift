//
//  RecipePlaceholderView.swift
//  RecipeViewer
//
//  Created by Mikhail Kolkov on 11/29/24.
//

import SwiftUI

struct RecipePlaceholderView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 8, content: {
            VStack(alignment: .leading, spacing: 4, content: {
                Text("recipe.name")
                    .font(.system(.headline, weight: .medium))
                    .foregroundStyle(.primary)
                Text("cuisine")
                    .font(.system(.footnote, weight: .regular))
                    .foregroundStyle(.secondary)
            })
            
            Rectangle()
                .foregroundStyle(.tertiary)
                .frame(height: 200)
                .cornerRadius(8)
            
            Rectangle()
                .foregroundStyle(.tertiary)
                .frame(height: 40)
                .cornerRadius(8)
            
            Rectangle()
                .foregroundStyle(.tertiary)
                .frame(height: 40)
                .cornerRadius(8)
        })
        .padding(12)
        .background(RoundedRectangle(cornerRadius: 8).strokeBorder(.tertiary, lineWidth: 1).background(.thinMaterial))
        .cornerRadius(8)
        .redacted(reason: .placeholder)
    }
}

#Preview("Placeholder", body: {
    RecipePlaceholderView()
})
