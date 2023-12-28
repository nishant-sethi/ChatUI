//
//  MessageView.swift
//  ChatUI
//
//  Created by Nishant sethi on 07/12/2023.
//

import SwiftUI

struct MessageView: View {
    
    var message:Conversations.Conversation.Message
    var body: some View {
        HStack {
            if message.isUser {
                Spacer()
            }
            Text(message.content)
                .foregroundColor(message.isUser ? .white : .black)
                .padding(10)
                .background(message.isUser ? Color.blue : Color.gray.opacity(0.5))
                .cornerRadius(10)
                .frame(maxWidth: UIScreen.main.bounds.width * 2 / 3, alignment: message.isUser ? .trailing : .leading)
                .fixedSize(horizontal: false, vertical: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                .id(message.id)
                .transition(.asymmetric(insertion: .scale, removal: .opacity))
                .accessibilityLabel("\(message.isUser ? "Sent by you:" : "Received:") \(message.content)")
            if !message.isUser {
                Spacer()
            }
        }
    }
}

#Preview {
    let message = Conversations.Conversation.Message(content: "", isUser: false)
    return MessageView(message: message)
}
