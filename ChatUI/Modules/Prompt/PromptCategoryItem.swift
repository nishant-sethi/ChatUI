//
//  PromptCategoryItem.swift
//  ChatUI
//
//  Created by Nishant sethi on 31/01/2024.
//

import SwiftUI

struct PromptCategoryItem: View {
    var prompt: Prompt
    var body: some View {
        VStack(alignment: .leading) {
            Text(prompt.act)
                .font(.custom("Satoshi", size: 16).weight(.bold))
                .multilineTextAlignment(.leading)
            Divider()
            Text(prompt.Subcategory)
                .font(.custom("Satoshi", size: 12).weight(.medium))
                .multilineTextAlignment(.leading)
        }
        .foregroundStyle(.white)
        .frame(width: 125, height: 75)
        .padding(10)
        .background(BackgroundGradient(from: prompt.from, to: prompt.to))
        .cornerRadius(20)
        .overlay {
            RoundedRectangle(cornerRadius: 20)
                .inset(by: 0.50)
                .stroke(Color(red: 0.92, green: 0.92, blue: 0.92), lineWidth: 0.50)
        }
    }
}

#Preview {
    PromptCategoryItem(prompt: PromptModelData().prompts[0])
}
