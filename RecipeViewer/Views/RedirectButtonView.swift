//
//  RedirectButtonView.swift
//  RecipeViewer
//
//  Created by Mikhail Kolkov on 11/29/24.
//

import SwiftUI

struct RedirectButtonView: View {
    var icon: Image
    var title: String
    var url: URL
    @State private var showSafariView = false
    var body: some View {
        HStack {
            icon
                .font(.system(.headline))
                .foregroundStyle(.orange)
            Text(title)
                .font(.system(.subheadline, weight: .regular))
            Spacer()
            
            Button(action: {
                DispatchQueue.main.async {
                    self.showSafariView.toggle()
                }
            }, label: {
                Image(systemName: "arrow.up.right")
                    .font(.system(.headline))
                    .foregroundStyle(.tertiary)
            })
        }
        .padding(.horizontal, 12)
        .padding(.vertical, 8)
        .background(.ultraThinMaterial)
        .cornerRadius(8)
        .sheet(isPresented: Binding(
            get: { showSafariView },
            set: {
                if !$0 {
                    showSafariView = false
                }
            }
        )) {
            SafariView(url: url)
        }
    }
}
