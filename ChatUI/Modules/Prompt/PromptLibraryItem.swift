//
//  PromptLibraryItem.swift
//  ChatUI
//
//  Created by Nishant sethi on 24/01/2024.
//

import SwiftUI

struct PromptLibraryItem: View {
    @EnvironmentObject var promptModelData: PromptModelData
    var item: Prompt
    
    private var promptIndex: Int? {
        promptModelData.prompts.firstIndex(where: { $0.id == item.id })
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            HStack {
                Text(item.act)
                    .font(.custom("Satoshi", size: 16).weight(.bold))
                
                Spacer()
                
                if let index = promptIndex {
                    FavoriteButton(isSet: $promptModelData.prompts[index].isFavorite)
                }
            }
            
            Text(item.description ?? "No description")
                .font(.custom("Satoshi", size: 14).weight(.medium))
                .multilineTextAlignment(.leading)
                .foregroundColor(.white)
            
            HStack {
                Text(item.category)
                    .font(.custom("Satoshi", size: 12).weight(.medium))
                
                Spacer()
                
                Text(item.subcategory)
                    .font(.custom("Satoshi", size: 12).weight(.medium))
            }
            .foregroundColor(.white)
        }
        .padding(EdgeInsets(top: 12, leading: 12, bottom: 16, trailing: 12))
        .background(BackgroundGradient(from: item.from, to: item.to))
        .cornerRadius(24)
        .overlay(
            RoundedRectangle(cornerRadius: 24)
                .inset(by: 0.50)
                .stroke(Color(red: 0.92, green: 0.92, blue: 0.92), lineWidth: 0.50)
        )
    }
}

#Preview {
    PromptLibraryItem(item: PromptModelData().prompts[0])
        .frame(width: 250,height: 200)
        .environmentObject(PromptModelData())
}
