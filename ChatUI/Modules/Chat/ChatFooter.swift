//
//  ChatFooter.swift
//  ChatUI
//
//  Created by Nishant sethi on 24/01/2024.
//

import SwiftUI

struct ChatFooter: View {
    @EnvironmentObject var promptModel: PromptViewModel
    @FocusState private var isInputActive: Bool
    @State private var message: String = ""
    
    var prompt: String?
    
    var body: some View {
        VStack {
            HStack {
                TextField("Ask Anything...", text: $message)
                    .font(.custom("Satoshi", size: 16))
                    .padding(10)
                    .background(RoundedRectangle(cornerRadius: 14).stroke(Color.secondary, lineWidth: 2))
                    .focused($isInputActive)
                    .accessibilityLabel("Message input")
                sendButton
            }
            .padding()
        }
        .onTapGesture {
            isInputActive = false
        }
    }
    
    private var sendButton: some View {
        Button(action: sendMessage) {
            Image(systemName: "paperplane")
                .foregroundStyle(.primary)
                .background(Circle().fill(Color.white).frame(width: 30, height: 30))
        }
        .disabled(message.isEmpty)
        .accessibilityLabel("Send Message")
        .accessibilityValue(message.isEmpty ? "Disabled" : "Enabled")
    }
    
    private func sendMessage() {
        guard !message.isEmpty else { return }
        
        promptModel.pushMessage(userMessage: message)
        Task {
            await promptModel.postMessageToGPT(prompt: prompt ?? "")
        }
        
        message = ""
        isInputActive = false
    }
}

#Preview {
    ZStack {
        ChatFooter()
            .environmentObject(PromptViewModel())
    }
}
