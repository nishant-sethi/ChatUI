//
//  ExploreView.swift
//  ChatUI
//
//  Created by Nishant sethi on 25/01/2024.
//

import SwiftUI

struct ExploreView: View {
    let exploreItems: [Explore]
    var body: some View {
        NavigationStack {
            List(exploreItems) { item in
                NavigationLink(destination: Text(item.description)) {
                    ExploreItem(exploreItem: item)
                }
            }
            .listStyle(.inset)
            .navigationTitle("Explore")
        }
    }
}

#Preview {
    ExploreView(exploreItems: Explore.sampleData)
}
