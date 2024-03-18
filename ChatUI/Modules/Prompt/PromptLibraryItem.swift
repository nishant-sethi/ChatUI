//
//  PromptLibraryItem.swift
//  ChatUI
//
//  Created by Nishant sethi on 24/01/2024.
//

import SwiftUI

struct PromptLibraryItem: View {
    
    @Environment(PromptModelData.self) var promptModelData
    var item: Prompt
    
    var promptIndex: Int {
        promptModelData.prompts.firstIndex(where: { $0.id == item.id })!
    }
    
    var body: some View {
        @Bindable var promptModelData = promptModelData
        VStack(alignment: .leading,spacing: 5){
            Group {
                HStack {
                    Text(item.act).font(.custom("Satoshi", size: 16).weight(.bold))
                    Spacer()
                    FavoriteButton(isSet: $promptModelData.prompts[promptIndex].isFavorite)
                }
                
                Text(item.Description ?? "no desc")
                    .font(.custom("Satoshi", size: 14).weight(.medium))
                    .multilineTextAlignment(.leading)
                
            }
            .foregroundColor(.white)
            HStack {
                Text(item.Category)
                    .font(.custom("Satoshi", size: 12).weight(.medium))
                    .foregroundColor(.white)
                Spacer()
                Text(item.Subcategory)
                    .font(.custom("Satoshi", size: 12).weight(.medium))
                    .foregroundColor(.white)
            }
        }
        .padding(EdgeInsets(top: 12, leading: 12, bottom: 16, trailing: 12))
        .background(BackgroundGradient(from: item.from, to: item.to))
        .cornerRadius(24)
        .overlay {
            RoundedRectangle(cornerRadius: 24)
                .inset(by: 0.50)
                .stroke(Color(red: 0.92, green: 0.92, blue: 0.92), lineWidth: 0.50)
        }
    }
}

#Preview {
    PromptLibraryItem(item: PromptModelData().prompts[0])
        .frame(width: 250,height: 200)
        .environment(PromptModelData())
}
