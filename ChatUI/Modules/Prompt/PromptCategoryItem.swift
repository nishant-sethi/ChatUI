//
//  PromptCategoryItem.swift
//  ChatUI
//
//  Created by Nishant sethi on 31/01/2024.
//

import SwiftUI

struct PromptCategoryItem: View {
    var prompt: Prompt
    
    private let itemWidth: CGFloat = 125
    private let itemHeight: CGFloat = 75
    private let cornerRadius: CGFloat = 20
    private let strokeLineWidth: CGFloat = 0.50
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(prompt.act)
                .font(.custom("Satoshi", size: 16).weight(.bold))
                .multilineTextAlignment(.leading)
            
            Divider()
            
            Text(prompt.subcategory)
                .font(.custom("Satoshi", size: 12).weight(.medium))
                .multilineTextAlignment(.leading)
        }
        .foregroundStyle(.white)
        .frame(width: itemWidth, height: itemHeight)
        .padding(10)
        .background(BackgroundGradient(from: prompt.from, to: prompt.to))
        .cornerRadius(cornerRadius)
        .overlay(
            RoundedRectangle(cornerRadius: cornerRadius)
                .inset(by: strokeLineWidth)
                .stroke(Color(red: 0.92, green: 0.92, blue: 0.92), lineWidth: strokeLineWidth)
        )
    }
}


#Preview {
    PromptCategoryItem(prompt: PromptModelData().prompts[0])
}
