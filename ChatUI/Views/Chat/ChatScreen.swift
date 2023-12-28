//
//  ChatScreen.swift
//  ChatUI
//
//  Created by Nishant sethi on 06/12/2023.
//

import SwiftUI

struct ChatScreen: View {
    
    @ObservedObject var chatViewModel: ChatsViewModel
    var conversation: Conversations.Conversation
    
    var body: some View {
        
        VStack(alignment: .leading) {
            ChatScreenBody(chatViewModel: chatViewModel, conversationId: conversation.id)
            ChatScreenFooter(chatViewModel: chatViewModel, conversationId: conversation.id)
        }
        .padding()
        .navigationTitle(conversation.getPrompt()) // TODO: show title instead
        .accessibilityLabel("Chat screen with \(conversation.getPrompt())")
        .onAppear {
            // TODO: Perform any actions needed when the view appears
            // TODO: Set initial VoiceOver focus if necessary
        }
    }
}

#Preview {
    let viewModel = ChatsViewModel()
    let chat = Conversations.Conversation(messages: [], prompt: "")
    return ChatScreen(chatViewModel: viewModel, conversation: chat)
}
