//
//  PromptsView.swift
//  ChatUI
//
//  Created by Nishant sethi on 26/01/2024.
//

import SwiftUI

struct PromptsView: View {
    
    @EnvironmentObject var promptModelData: PromptModelData
    @EnvironmentObject var promptVM: PromptViewModel
    @State private var showFavoritesOnly = false
    
    var categoryItems: [Prompt]
    var filteredPrompts: [Prompt] {
        categoryItems.filter { prompt in
            (!showFavoritesOnly || prompt.isFavorite)
        }
    }
    
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVStack {
                    Toggle(isOn: $showFavoritesOnly) {
                        Text("Favorites only")
                            .font(.custom("Satoshi", size: 16).weight(.bold))
                            .foregroundStyle(.white)
                    }
                    .padding()
                    
                    ForEach(filteredPrompts) { item in
                        NavigationLink(destination: Chat(title: item.act)) {
                            PromptLibraryItem(item: item)
                        }
                        .padding(.vertical)
                    }
                }
                .padding(.horizontal)
                .navigationTitle("Prompts")
            }
            .background(Color(red: 0.16, green: 0.18, blue: 0.20))
        }
    }
}

#Preview {
    PromptsView(categoryItems: PromptModelData().prompts)
        .environmentObject(PromptModelData())
        .environmentObject(PromptViewModel())
    
}
