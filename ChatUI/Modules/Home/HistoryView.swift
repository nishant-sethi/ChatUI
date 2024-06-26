//
//  HistoryView.swift
//  ChatUI
//
//  Created by Nishant sethi on 26/01/2024.
//

import SwiftUI

struct HistoryView: View {
//    @ObservedObject var promptVM: PromptViewModel
    @EnvironmentObject var historyVM: HistoryViewModel
    
    var body: some View {
        NavigationStack {
            List(historyVM.history) { item in
                NavigationLink(destination: Chat(history: item)) {
                    ChatHistoryItem(historyItem: item)
                }
            }
            .listStyle(.inset)
            .navigationTitle("Chat History")
        }
    }
}

#Preview {
    HistoryView()
        .environmentObject(HistoryViewModel())
}
