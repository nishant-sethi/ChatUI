//
//  Chat.swift
//  ChatUI
//
//  Created by Nishant sethi on 24/01/2024.
//

import SwiftUI

struct Chat: View {
    @ObservedObject var promptVM: PromptViewModel
    @ObservedObject var historyVM: HistoryViewModel
    
    var history: History?
    var title: String?
    var prompt: String?
    
    var body: some View {
        VStack(alignment: .leading) {
            ChatBody(title:title,prompt: prompt, promptVM: promptVM, history: history)
            
            ChatFooter(promptModel: promptVM, prompt: prompt)
            Spacer()
        }
//        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/,maxHeight: .infinity)
//        .background(Color(red: 0.16, green: 0.18, blue: 0.20))
        .onAppear {
            if history?.prompt == nil {
                promptVM.resetMessages()
            }
        }
        .onDisappear {
            if history?.prompt == nil && promptVM.messages.count > 0{
                getContext()
            }
        }
    }
    
    private func getContext() {
        Task {
            await historyVM.getContextFromConversation(promptVM.messages, history?.id)
        }
    }
    
}

#Preview {
    Chat(promptVM: PromptViewModel(), historyVM: HistoryViewModel(), history: History.sampleData[0])
}
