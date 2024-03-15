//
//  FeaturedCard.swift
//  ChatUI
//
//  Created by Nishant sethi on 19/01/2024.
//

import SwiftUI

struct FeaturedCard: View {
    var text: String
    
    var body: some View {
        HStack {
            iconPlaceholder
            Text(text)
                .font(Font.custom("Satoshi", size: 14))
                .foregroundColor(.white)
                .padding()
        }
        .frame(width: 343, height: 90)
        .background(Color(red: 0.38, green: 0.38, blue: 0.38))
        .cornerRadius(35)
        .overlay(
            RoundedRectangle(cornerRadius: 35)
                .stroke(Color.white, lineWidth: 0.5)
        )
    }
    
    private var iconPlaceholder: some View {
        Rectangle()
            .fill(Color(red: 0.14, green: 0.14, blue: 0.14))
            .frame(width: 79.15, height: 78)
            .cornerRadius(31)
    }
}

#Preview {
    FeaturedCard(text: "this is featued card")
}
