//
//  WarningBannerView.swift
//  RecipeViewer
//
//  Created by Mikhail Kolkov on 11/29/24.
//

import SwiftUI

struct WarningBannerView: View {
    var icon: Image
    var title: String
    var text: String
    var body: some View {
        VStack {
            icon
                .font(.system(size: 48))
                .foregroundColor(.secondary)
            Text(title)
                .font(.system(.headline))
                .foregroundColor(.primary)
            Text(text)
                .font(.system(.footnote))
                .foregroundColor(.secondary)
        }
        .frame(maxWidth: .infinity, alignment: .center)
        .padding(12)
        .background(RoundedRectangle(cornerRadius: 8).strokeBorder(.tertiary, lineWidth: 1).background(.thinMaterial))
        .cornerRadius(8)
    }
}

#Preview {
    WarningBannerView(icon: Image(systemName: "tray"), title: "No Recipes Available", text: "Pull down to refresh and fetch new recipes")
}
