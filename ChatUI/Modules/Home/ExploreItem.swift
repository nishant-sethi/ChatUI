//
//  ExploreItem.swift
//  ChatUI
//
//  Created by Nishant sethi on 24/01/2024.
//

import SwiftUI

struct ExploreItem: View {
    let exploreItem: Explore
    var body: some View {
        VStack(alignment: .leading,spacing: 10) {
            Image(systemName: exploreItem.iconName)
                .foregroundStyle(.white)
            Text(exploreItem.name)
                .font(Font.custom("Satoshi", size: 16).weight(.medium))
                .foregroundColor(.white)
            Text(exploreItem.description)
                .font(Font.custom("Satoshi", size: 12))
                .foregroundColor(Color(red: 0.88, green: 0.88, blue: 0.88))
                .multilineTextAlignment(.leading)
        }
        .padding(EdgeInsets(top: 12, leading: 12, bottom: 16, trailing: 12))
        .background(Color(red: 0.38, green: 0.38, blue: 0.38))
        .cornerRadius(24)
        .overlay {
            RoundedRectangle(cornerRadius: 24)
                .inset(by: 0.50)
                .stroke(Color(red: 0.92, green: 0.92, blue: 0.92), lineWidth: 0.50)
        }
    }
}

#Preview {
    let exploreItem = Explore.sampleData[0]
    return ZStack {
        BackgroundGradient(from: Color(red: 0.42, green: 0.75, blue: 0.73), to: Color(red: 0, green: 0.15, blue: 0.33).opacity(0.8))
        ExploreItem(exploreItem: exploreItem)
    }
    .previewLayout(.fixed(width: 400, height: 60))
}
