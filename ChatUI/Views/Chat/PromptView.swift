//
//  PromptView.swift
//  ChatUI
//
//  Created by Nishant sethi on 08/12/2023.
//

import SwiftUI

struct PromptView: View {
    @ObservedObject var chatViewModel: ChatsViewModel
    @Binding var isNewChat: Bool

    var body: some View {
        NavigationView {
            VStack {
                TextField("Enter your Prompt", text: $chatViewModel.prompt)
                    .textFieldStyle(.roundedBorder)
                    .padding()
            }
            .navigationTitle("New Conversation")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Cancel") {
                        isNewChat = false
                    }
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Done") {
                        chatViewModel.createNewConveration(prompt: chatViewModel.prompt)
                        chatViewModel.prompt = ""
                        isNewChat = false
                    }
                    .disabled(chatViewModel.prompt.isEmpty)
                }
            }
        }
    }
}

#Preview {
    let chatViewModel = ChatsViewModel()
    return PromptView(chatViewModel: chatViewModel, isNewChat: .constant(false))
}
