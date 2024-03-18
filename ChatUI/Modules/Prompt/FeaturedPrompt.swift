//
//  FeaturedPrompt.swift
//  ChatUI
//
//  Created by Nishant sethi on 31/01/2024.
//

import SwiftUI

struct FeaturedPrompt: View {
    var prompt: Prompt
    var body: some View {
        NavigationLink(destination: Chat(promptVM: PromptViewModel(), historyVM: HistoryViewModel(), history: History.sampleData[0], title: prompt.act)) {
            BackgroundGradient(from: prompt.from, to: prompt.to)
                .overlay {
                    TextOverlay(prompt: prompt)
                }
        }
//        .navigationTitle(prompt.act)
        
    }
}
struct TextOverlay: View {
    var prompt: Prompt
    
    var gradient: LinearGradient {
        .linearGradient(
            Gradient(colors: [.black.opacity(0.6), .black.opacity(0)]),
            startPoint: .bottom,
            endPoint: .center)
    }
    
    var body: some View {
        ZStack(alignment: .bottomLeading) {
            gradient
            VStack(alignment: .leading,spacing: 10) {
                Text(prompt.act)
                    .font(.title)
                    .bold()
                    .multilineTextAlignment(.leading)
                Text(prompt.Description ?? "")
                    .font(.subheadline)
                    .multilineTextAlignment(.leading)
                Text(prompt.Category)
                    .font(.caption)
                    .multilineTextAlignment(.leading)
            }
            .padding()
        }
        .foregroundStyle(.white)
    }
}
#Preview {
    FeaturedPrompt(prompt: PromptModelData().prompts[100])
        .aspectRatio(3/2, contentMode: .fit)
}
