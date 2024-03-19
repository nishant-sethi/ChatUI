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
    @ObservedObject var promptVM: PromptViewModel
    var body: some View {
        VStack(alignment: .leading) {
            HStack{
                NavigationLink(destination: PromptsView(promptVM: promptVM, categoryItems: items)) {
                    Text(categoryName)
                        .font(.custom("Satoshi", size: 22).weight(.medium))
                        .foregroundColor(.white)
                }
            }
            .padding([.leading,.trailing])
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(alignment: .top, spacing: 0) {
                    ForEach(items) { prompt in
                        NavigationLink(destination: Chat(history: History.sampleData[0],title: prompt.act)) {
                            PromptCategoryItem(prompt: prompt)
                        }
                        .navigationTitle("Prompt Library")
                    }
                    .padding([.leading,.top])
                }
                
            }
        }
        .padding([.top,.bottom])
        
    }
}

#Preview {
    let prompts = PromptModelData().prompts
    return PromptCategoryRow(
        categoryName: prompts[0].Category,
        items: Array(prompts.prefix(3)),
        promptVM: PromptViewModel()
    )
    .background(Color(red: 0.16, green: 0.18, blue: 0.20))
}
