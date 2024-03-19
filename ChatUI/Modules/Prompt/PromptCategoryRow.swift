//
//  PromptCategoryRow.swift
//  ChatUI
//
//  Created by Nishant sethi on 31/01/2024.
//

import SwiftUI

struct PromptCategoryRow: View {
    var categoryName: String
    var items: [Prompt]
    @EnvironmentObject var promptVM: PromptViewModel
    
    var body: some View {
        VStack(alignment: .leading) {
            NavigationLink(destination: PromptsView(categoryItems: items)) {
                Text(categoryName)
                    .font(.custom("Satoshi", size: 22).weight(.medium))
                    .foregroundColor(.white)
                    .padding(.horizontal)
            }
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(alignment: .top, spacing: 0) {
                    ForEach(items) { prompt in
                        NavigationLink(destination: Chat(title: prompt.act, description: prompt.description)) {
                            PromptCategoryItem(prompt: prompt)
                        }
                        .padding(.leading, items.first == prompt ? 0 : 10) // Add padding except for the first item
                        .padding(.top)
                    }
                }
            }
        }
        .padding(.vertical)
    }
}

#Preview {
    let prompts = PromptModelData().prompts
    return PromptCategoryRow(
        categoryName: prompts[0].category,
        items: Array(prompts.prefix(3))
    )
    .background(Color(red: 0.16, green: 0.18, blue: 0.20))
    .environmentObject(PromptViewModel())
}
