//
//  Chat.swift
//  ChatUI
//
//  Created by Nishant sethi on 24/01/2024.
//

import SwiftUI

struct Chat: View {
    @EnvironmentObject var promptVM: PromptViewModel
    @EnvironmentObject var historyVM: HistoryViewModel
    
    var history: History?
    var title: String?
    var prompt: String?
    
    var body: some View {
        VStack(alignment: .leading) {
            ChatBody(title:title,prompt: prompt,history: history)
            ChatFooter(prompt: prompt)
            Spacer()
        }
        .onAppear {
            checkHistoryAndResetMessagesIfNeeded()
        }
        .onDisappear {
            saveContextIfNeeded()
        }
    }
    
    private func checkHistoryAndResetMessagesIfNeeded() {
        if history?.prompt == nil {
            promptVM.resetMessages()
        }
    }
    
    private func saveContextIfNeeded() {
        if history?.prompt == nil && !promptVM.messages.isEmpty {
            getContext()
        }
    }
    
    private func getContext() {
        Task {
            await historyVM.getContextFromConversation(promptVM.messages, history?.id)
        }
    }
    
}

#Preview {
    Chat(history: History.sampleData[0])
        .environmentObject(PromptViewModel())
        .environmentObject(HistoryViewModel())
}
