//
//  PromptCategoryHome.swift
//  ChatUI
//
//  Created by Nishant sethi on 31/01/2024.
//

import SwiftUI

struct PromptCategoryHome: View {
    
    @Environment(PromptModelData.self) var promptModelData
    @EnvironmentObject var promptVM: PromptViewModel
    @State private var showFilters = false
    @State var toggleMap: [String: Bool] = [:]
    
    var body: some View {

        ScrollView {
            Grid {
                PageView(pages: promptModelData.features.map { FeaturedPrompt(prompt: $0) })
                    .listRowInsets(EdgeInsets())
                
                ForEach(promptModelData.categories.keys.sorted(), id: \.self) { key in
                    GridRow {
                        PromptCategoryRow(categoryName: key, items: promptModelData.categories[key]!,promptVM: promptVM)
                    }
                    Divider()
                        .foregroundStyle(.white)
                }
            }
            
            .background(Color(red: 0.16, green: 0.18, blue: 0.20))
            
        }
        .toolbar {
            Button {
                showFilters.toggle()
            } label: {
                Label("User Profile", systemImage: "line.3.horizontal.decrease.circle")
            }
        }
        .sheet(isPresented: $showFilters) {
            NavigationStack {
                PromptFilter(selectAll: false, toggleMap: $toggleMap)
                    .toolbar {
                        ToolbarItem(placement: .cancellationAction) {
                            Button("Cancel") {
                                showFilters = false
                            }
                        }
                        ToolbarItem(placement: .confirmationAction) {
                            Button("Done") {
                                promptModelData.updateCategories(filteredCategories: Dictionary(uniqueKeysWithValues: toggleMap.filter {$0.value == true}).keys.sorted())
                                showFilters = false
                            }
                        }
                    }
            }
        }
        
    }
}

#Preview {
    PromptCategoryHome()
        .environment(PromptModelData())
        .environmentObject(PromptViewModel())
}
