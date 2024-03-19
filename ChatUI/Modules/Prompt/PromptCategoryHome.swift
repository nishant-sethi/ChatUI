//
//  PromptCategoryHome.swift
//  ChatUI
//
//  Created by Nishant sethi on 31/01/2024.
//

import SwiftUI

struct PromptCategoryHome: View {
    
    @EnvironmentObject var promptModelData: PromptModelData
    @EnvironmentObject var promptVM: PromptViewModel
    @State private var showFilters = false
    @State var toggleMap: [String: Bool] = [:]
    
    var body: some View {
        
        ScrollView {
            Grid {
                PageView(pages: promptModelData.features.map(FeaturedPrompt.init))
                    .listRowInsets(EdgeInsets())
                
                ForEach(sortedCategories, id: \.self) { key in
                    GridRow {
                        if let items = promptModelData.categories[key] {
                            PromptCategoryRow(categoryName: key, items: items)
                        }
                    }
                    Divider()
                        .foregroundStyle(.white)
                }
            }
            .background(Color(red: 0.16, green: 0.18, blue: 0.20))
        }
        .navigationTitle("Prompt Library")
        .toolbar {
            Button {
                showFilters.toggle()
            } label: {
                Label("User Profile", systemImage: "line.3.horizontal.decrease.circle")
            }
        }
        .sheet(isPresented: $showFilters) {
            filterView
        }
        
    }
    private var sortedCategories: [String] {
        promptModelData.categories.keys.sorted()
    }
    
    private var filterView: some View {
        NavigationStack {
            PromptFilter(selectAll: false, toggleMap: $toggleMap)
                .toolbar {
                    ToolbarItem(placement: .cancellationAction) {
                        Button("Cancel") {
                            showFilters.toggle()
                        }
                    }
                    ToolbarItem(placement: .confirmationAction) {
                        Button("Done") {
                            updateFilteredCategories()
                            showFilters.toggle()
                        }
                    }
                }
        }
    }
    
    private func updateFilteredCategories() {
        let filteredKeys = toggleMap.filter { $0.value }.keys.sorted()
        promptModelData.updateCategories(filteredCategories: filteredKeys)
    }
}

#Preview {
    PromptCategoryHome()
        .environmentObject(PromptModelData())
        .environmentObject(PromptViewModel())
}
