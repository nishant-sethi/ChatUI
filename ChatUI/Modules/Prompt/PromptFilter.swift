//
//  PromptFilter.swift
//  ChatUI
//
//  Created by Nishant sethi on 31/01/2024.
//

import SwiftUI

struct PromptFilter: View {
    @EnvironmentObject var promptModelData: PromptModelData
    @Binding var selectAll: Bool
    @Binding var toggleMap: [String: Bool]
    
    var body: some View {
        VStack(alignment: .leading) {
            Toggle("Select All", isOn: $selectAll.onChange(toggleAll))
            
            ForEach(promptModelData.allCategories, id: \.self) { category in
                Toggle(category, isOn: bindingForCategory(category))
                    .disabled(selectAll)
            }
        }
        .padding()
    }
    
    private var sortedCategories: [String] {
        promptModelData.categories.keys.sorted()
    }
    
    private func bindingForCategory(_ category: String) -> Binding<Bool> {
        Binding(
            get: { toggleMap[category, default: false] },
            set: { toggleMap[category] = $0 }
        )
    }
    
    private func toggleAll(newValue: Bool) {
        selectAll = newValue
        for category in promptModelData.allCategories {
            toggleMap[category] = newValue
        }
    }
}

extension Binding {
    func onChange(_ handler: @escaping (Value) -> Void) -> Binding<Value> {
        Binding(
            get: { self.wrappedValue },
            set: { newValue in
                self.wrappedValue = newValue
                handler(newValue)
            }
        )
    }
}
#Preview {
    PromptFilter(selectAll: .constant(false), toggleMap: .constant([:]))
        .environmentObject(PromptModelData())
}
