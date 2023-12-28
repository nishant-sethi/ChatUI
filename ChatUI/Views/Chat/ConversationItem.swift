//
//  ConversationItem.swift
//  ChatUI
//
//  Created by Nishant sethi on 08/12/2023.
//

import SwiftUI

struct ConversationItem: View {
    var user: String
    var chat: Conversations.Conversation
    
    var body: some View {
        HStack {
            Image(systemName: "person")
                .resizable()
                .background( Color("color_bg_inverted").opacity(0.05))
                .frame(width: 60, height: 60)
                .clipShape(Circle())
                .accessibilityLabel("User Profile")
            
            VStack(alignment: .leading, spacing: 8) {
                HStack{
                    Text(user)
                        .fontWeight(.semibold)
                        .padding(.top,3)
                    Spacer()
                    Text("HH:SS AM")
                        .foregroundColor(Color("color_primary"))
                        .padding(.top, 3)
                }
                .accessibilityElement(children: .combine)
                
                HStack {
                    Text(chat.getPrompt())
                        .foregroundColor(Color("color_bg_inverted").opacity(0.5))
                        .lineLimit(3)
                        .accessibilityElement(children: .combine)
                }
            }
        }
        .accessibilityElement(children: .combine)
        .accessibilityLabel("user, last message at hh:mm: \(chat.getPrompt())")
    }
}

#Preview {
    let chat = Conversations.Conversation(messages: [], prompt: "")
    return ConversationItem(user: "NS", chat: chat)
}
