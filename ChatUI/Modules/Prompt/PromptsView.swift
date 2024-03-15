//
//  PromptsView.swift
//  ChatUI
//
//  Created by Nishant sethi on 26/01/2024.
//

import SwiftUI

struct PromptsView: View {
    
    @Environment(PromptModelData.self) var promptModelData
    @ObservedObject var promptVM: PromptViewModel
    @State private var showFavoritesOnly = false
    var categoryItems: [Prompt]
    var filteredPrompts: [Prompt] {
        categoryItems.filter { prompt in
            (!showFavoritesOnly || prompt.isFavorite)
        }
    }
    
//    let promptItems: [Prompt]
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVStack {
                    Toggle(isOn: $showFavoritesOnly) {
                        Text("Favorites only")
                            .font(.custom("Satoshi", size: 16).weight(.bold))
                            .foregroundStyle(.white)
                    }
                    ForEach(filteredPrompts){ item in
                        NavigationLink(destination: Chat(promptVM: promptVM, historyVM: HistoryViewModel(), title: item.act)) {
                            PromptLibraryItem(item: item)
                        }
                    }
                }
                .padding([.leading,.trailing,.bottom])
                .animation(.default, value: filteredPrompts)
                .navigationTitle("Prompts")
            }
            .background(Color(red: 0.16, green: 0.18, blue: 0.20))
        }
    }
}

#Preview {
    PromptsView(promptVM: PromptViewModel(),categoryItems: PromptModelData().prompts)
        .environment(PromptModelData())
    
}
