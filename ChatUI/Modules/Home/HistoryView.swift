//
//  HistoryView.swift
//  ChatUI
//
//  Created by Nishant sethi on 26/01/2024.
//

import SwiftUI

struct HistoryView: View {
    @ObservedObject var promptVM: PromptViewModel
    let historyItems: [History]
    var body: some View {
        NavigationStack {
            List(historyItems) { item in
                NavigationLink(destination: Chat(promptVM: promptVM, historyVM: HistoryViewModel(),history: item)) {
                    ChatHistoryItem(historyItem: item)
                }
            }
            .listStyle(.inset)
            .navigationTitle("Chat History")
        }
    }
}

#Preview {
    HistoryView(promptVM: PromptViewModel(), historyItems: History.sampleData)
}
