//
//  ChatUIHeader.swift
//  ChatUI
//
//  Created by Nishant sethi on 29/11/2023.
//

import SwiftUI

struct ChatUIHeader: View {
    @ObservedObject var chatViewModel: ChatsViewModel
    @State private var isNewChat = false
    
    var body: some View {
        HStack {
            Spacer()
            Button(action: {
                isNewChat = true
            }){
                Image(systemName: "plus.circle")
                    .foregroundColor(Color("color_primary"))
                    .font(.title2)
                    .accessibilityLabel("New Chat")
            }
            .frame(minWidth: 44, minHeight: 44)  // Ensuring adequate tap target size
            
            .sheet(isPresented: $isNewChat) {
                PromptView(chatViewModel:chatViewModel, isNewChat: $isNewChat)
            }
        }
    }
}

#Preview {
    let chatViewModel = ChatsViewModel()
    return ChatUIHeader(chatViewModel: chatViewModel)
}
