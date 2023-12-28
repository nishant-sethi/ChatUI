//
//  ChatScreenBody.swift
//  ChatUI
//
//  Created by Nishant sethi on 07/12/2023.
//

import SwiftUI

struct ChatScreenBody: View {
    
    @ObservedObject var chatViewModel: ChatsViewModel
    var conversationId: UUID
    private var messages: Array<Conversations.Conversation.Message> {
        chatViewModel.getConversationById(id: conversationId)?.messages ?? []
    }
    private func scrollToBottom(scrollView: ScrollViewProxy) {
        withAnimation {
            if let lastMessage = messages.last {
                scrollView.scrollTo(lastMessage.id, anchor: .bottom)
            }
        }
    }
    var body: some View {
        ScrollViewReader { scrollView in
            ScrollView {
                LazyVStack {
                    ForEach(messages) { message in
                        MessageView(message: message)
                    }
                }
                Spacer()
                if chatViewModel.isFetching {
                    ProgressView("Fetching...")
                        .accessibilityLabel("Fetching new messages")
                }
            }
            .scrollIndicators(.hidden)
            .onChange(of: messages.count) {
                scrollToBottom(scrollView: scrollView)
            }
        }
    }
}

#Preview {
    let viewModel = ChatsViewModel()
    return ChatScreenBody(chatViewModel: viewModel, conversationId: UUID())
}
