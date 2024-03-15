//
//  PromptFilter.swift
//  ChatUI
//
//  Created by Nishant sethi on 31/01/2024.
//

import SwiftUI

struct PromptFilter: View {
    @Environment(PromptModelData.self) var promptModelData;
    @State var selectAll: Bool
    @Binding var toggleMap: [String: Bool]
    
    var body: some View {
        VStack(alignment: .leading) {
            Toggle(isOn: $selectAll) {
                Text("Select All")
            }
            ForEach(promptModelData.categoriesForFilter.keys.sorted(), id: \.self) { category in
                Toggle(isOn: bindingForCategory(category), label: {
                    Text(category)
                })
                .disabled(selectAll)
            }
        }
        .padding()
    }
    
    private func bindingForCategory(_ category: String) -> Binding<Bool> {
        Binding(
            get: { self.toggleMap[category, default: false] },
            set: { self.toggleMap[category] = $0 }
        )
    }
    private func toggleAll(newValue: Bool) {
        for category in promptModelData.categories.keys {
            toggleMap[category] = !newValue
        }
    }
}

// Helper extension to react to changes in a Binding
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
    PromptFilter(selectAll: false, toggleMap: .constant([:]))
        .environment(PromptModelData())
}
