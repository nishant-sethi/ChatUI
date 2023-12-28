//
//  ChatUsers.swift
//  ChatUI
//
//  Created by Nishant sethi on 29/11/2023.
//

import SwiftUI

struct ChatUsers: View {
    @ObservedObject var chatViewModel: ChatsViewModel
//    private func delete(at offsets: IndexSet) {
//        chatViewModel.deleteConversation(at: offsets)
//    }
    var body: some View {
        List(chatViewModel.conversations) { chat in
            NavigationLink(destination: ChatScreen(chatViewModel: chatViewModel, conversation: chat)) {
                ConversationItem(user: "user", chat: chat) // Assuming chat has a participantName property
                    .accessibilityElement(children: .combine)
                    .accessibilityHint("Opens the conversation with user")
            }
        }
        .listStyle(.plain)
        .accessibilityLabel("List of conversations")
    }
}

#Preview {
    let chatViewModel = ChatsViewModel()
    return ChatUsers(chatViewModel: chatViewModel)
}
