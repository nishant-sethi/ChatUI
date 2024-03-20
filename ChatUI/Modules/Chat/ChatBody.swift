//
//  ChatBody.swift
//  ChatUI
//
//  Created by Nishant sethi on 27/01/2024.
//

import SwiftUI

struct ChatBody: View {
    @EnvironmentObject var promptVM: PromptViewModel
    
    var title: String?
    var description: String?
    var prompt: String?
    var history: History?
    
    
    var body: some View {
        VStack(alignment: .leading){
            chatTitle
            Spacer()
            if promptVM.messages.isEmpty {
                welcomeMessage
            } else {
                messagesList(messages: messageSource)
            }
        }
        .padding()
        
    }
    private var messageSource: [Message] {
           history?.messages ?? promptVM.messages
       }
    private var chatTitle: some View {
        HStack {
            Spacer()
            Text(history?.prompt ?? title ?? "New Chat")
                .font(.custom("Satoshi", size: 14).weight(.bold))
            Spacer()
        }
    }
    
    private var welcomeMessage: some View {
        return Group {
            Text(description ?? "Welcome! When typing a prompt, remember to:\n\nKeep your sentences concise and clear.\nAvoid ambiguity or vagueness in your language.\nUse appropriate and respectful language.\nRefrain from sharing personal or confidential information.\nUnderstand that the model's knowledge is not always up to date.\n\nFollowing these guidelines ensures better interactions ✨")
                .font(.custom("Satoshi", size: 14).weight(.bold))
            Spacer()
        }
        
    }
    
    private func messagesList(messages: [Message]) -> some View {
        ScrollViewReader { scrollView in
            ScrollView {
                LazyVStack {
                    ForEach(messages) { message in
                        ChatMessageView(message: message)
                    }
                    if promptVM.isFetching {
                        ProgressView("Fetching...")
                            .accessibilityLabel("Fetching new messages")
                    }
                }
                .onChange(of: promptVM.messages.count) {
                    scrollToBottom(scrollView: scrollView)
                }
            }
            .scrollIndicators(.hidden)
        }
    }
    
    private func scrollToBottom(scrollView: ScrollViewProxy) {
        withAnimation {
            if let lastMessage = promptVM.messages.last {
                scrollView.scrollTo(lastMessage.id, anchor: .bottom)
            }
        }
    }
}

#Preview {
    ChatBody( history: History.sampleData[0])
        .background(Color(red: 0.16, green: 0.18, blue: 0.20))
        .environmentObject(PromptViewModel())
}
