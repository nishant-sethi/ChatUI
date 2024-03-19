//
//  ChatFooter.swift
//  ChatUI
//
//  Created by Nishant sethi on 24/01/2024.
//

import SwiftUI

struct ChatFooter: View {
    
    @ObservedObject var promptModel: PromptViewModel
    @FocusState private var isInputActive: Bool
    
    @State var message: String = ""
    
    var prompt: String?
    
    var body: some View {
        VStack {
            HStack {
                TextField("Ask Anything...", text: $message)
                       .font(.custom("Satoshi", size: 16))
                       .padding(10)
                       .overlay(
                           RoundedRectangle(cornerRadius: 14)
                               .stroke(Color.secondary, lineWidth: 2))
            .accessibilityLabel("Message input")
                Spacer()
                Button(action: sendMessage) {
                    Image(systemName: "paperplane")
                        .foregroundStyle(.black)
                        .background {
                            Circle()
                                .foregroundStyle(.clear)
                                .background(.white)
                                .frame(width: 30,height: 30)
                                .clipShape(Circle())
                        }
                }
                .disabled(message.isEmpty)
                .accessibilityLabel("Send Message")
                .accessibilityValue(message.isEmpty ? "Disabled" : "Enabled")
                
            }
            .padding()
        }
        .onTapGesture {
            isInputActive = false
//            dismissKeyboard()
        }
        
    }
    private func sendMessage() {
        promptModel.pushMessage(userMessage: message)
         Task {
             await promptModel.postMessageToGPT(prompt: prompt ?? "")
         }
        message = ""
        isInputActive = false
    }
    private func dismissKeyboard() {
            UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
        }
}

#Preview {
    ZStack {
//        BackgroundGradient(from: Color(red: 0.42, green: 0.75, blue: 0.73), to: Color(red: 0, green: 0.15, blue: 0.33).opacity(0.8))
        ChatFooter(promptModel: PromptViewModel())
    }
}
