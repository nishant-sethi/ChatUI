//
//  ChatScreenFooter.swift
//  ChatUI
//
//  Created by Nishant sethi on 07/12/2023.
//

import SwiftUI

struct ChatScreenFooter: View {
    @ObservedObject var chatViewModel: ChatsViewModel
    @State var message: String = ""
    @FocusState private var isInputActive: Bool
    
    var conversationId: UUID
    
    private func sendMessage() {
        chatViewModel.addMessageToConversation(id: conversationId, message: message, isUser: true)
        
        // Uncomment the following when network functionality is ready
//         Task {
//             await chatViewModel.postMessageToGPT(id: conversationId)
//         }
        message = ""
        isInputActive = false
    }
    
    var body: some View {
        VStack {
            HStack {
                TextField("Enter your Message", text: $message)
                    .font(.caption2)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(3)
                    .accessibilityLabel("Message input")
                
                Spacer()
                
                Button(action: sendMessage) {
                    Image(systemName: chatViewModel.isFetching ? "circle.hexagongrid.circle" : "paperplane")
                }
                .disabled(message.isEmpty)
                .accessibilityLabel("Send Message")
                .accessibilityValue(message.isEmpty ? "Disabled" : "Enabled")
            }
            .padding(3)
        }
        .onTapGesture {
            isInputActive = false
        }
    }
}

#Preview {
    let viewModel = ChatsViewModel()
    return ChatScreenFooter(chatViewModel: viewModel, message: "", conversationId: UUID())
}
