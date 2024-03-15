//
//  ChatBody.swift
//  ChatUI
//
//  Created by Nishant sethi on 27/01/2024.
//

import SwiftUI

struct ChatBody: View {
    var title: String?
    var prompt: String?
    @ObservedObject var promptVM: PromptViewModel
    var history: History?

    
    var body: some View {
        VStack(alignment: .leading){
            HStack {
                Spacer()
                Text(history?.prompt ?? "New Chat" )
                    .font(.custom("Satoshi", size: 14).weight(.bold))
                .foregroundColor(Color(red: 0.76, green: 0.76, blue: 0.76))
                Spacer()
            }
            if promptVM.messages.isEmpty {
                Spacer()
                Text("Welcome! When typing a prompt in Mindmate, remember to:\n\nKeep your sentences concise and clear.\nAvoid ambiguity or vagueness in your language.\nUse appropriate and respectful language.\nRefrain from sharing personal or confidential information.\nUnderstand that the model's knowledge is based on data up until September 2021.\n\nFollowing these guidelines ensures better interactions ✨")
                    .font(.custom("Satoshi", size: 14).weight(.bold))
                  .foregroundColor(Color(red: 0.76, green: 0.76, blue: 0.76))
                Spacer()
            } else {
                ScrollViewReader { scrollView in
                    ScrollView {
                        LazyVStack {
                            ForEach(promptVM.messages) { message in
                                ChatMessageView(message: message)
                            }
                            if promptVM.isFetching {
                                ProgressView("Fetching...")
                                    .foregroundColor(Color(red: 0.96, green: 0.96, blue: 0.96))
                                    .accessibilityLabel("Fetching new messages")
                            }
                        }
                        Spacer()
                    }
                    .scrollIndicators(.hidden)
                    .onChange(of: promptVM.messages.count) {
                        scrollToBottom(scrollView: scrollView)
                    }
                }
            }
            
        }
        .padding()
        
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
    ChatBody(promptVM: PromptViewModel(), history: History.sampleData[0])
        .background(Color(red: 0.16, green: 0.18, blue: 0.20).ignoresSafeArea(.all))
}
