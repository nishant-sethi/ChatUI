//
//  ChatMessageView.swift
//  ChatUI
//
//  Created by Nishant sethi on 28/01/2024.
//

import SwiftUI

struct ChatMessageView: View {
    var message: Message
    var body: some View {
        HStack {
            if message.isUser {
                Spacer()
                VStack(alignment: .trailing){
                    UserMessageView(message: message)
                    Text("\(message.timestamp.formatted(date: Date.FormatStyle.DateStyle.numeric, time: Date.FormatStyle.TimeStyle.shortened))")
                        .font(.caption)
                        .foregroundColor(.white)
                }
                .padding(.bottom)
                
            }
            else {
                VStack(alignment: .leading) {
                    BotMessageView(message: message)
                    Text("\(message.timestamp.formatted(date: Date.FormatStyle.DateStyle.numeric, time: Date.FormatStyle.TimeStyle.shortened))")
                        .font(.caption)
                        .foregroundColor(.white)
                }
                .padding(.bottom)
                Spacer()
            }
        }
    }
    private func UserMessageView(message: Message) -> some View {
        return HStack {
            Text(message.content)
                .font(.custom("Satoshi", size: 14))
                .foregroundColor(Color(red: 0.96, green: 0.96, blue: 0.96))
        }
        .padding(EdgeInsets(top: 17, leading: 20, bottom: 17, trailing: 20))
        .background(Color(red: 0.68, green: 0.68, blue: 0.68).opacity(0.60))
        .cornerRadius(24)
        .overlay(
            RoundedRectangle(cornerRadius: 24)
                .inset(by: 0.50)
                .stroke(Color(red: 0.76, green: 0.76, blue: 0.76), lineWidth: 0.50)
        )
    }
    
    private func BotMessageView(message: Message) -> some View {
        return HStack {
            Text(message.content)
                .font(.custom("Satoshi", size: 12))
                .foregroundColor(Color(red: 0.09, green: 0.09, blue: 0.09))
        }
        .padding(EdgeInsets(top: 12, leading: 16, bottom: 16, trailing: 16))
        .background(Color(red: 1, green: 1, blue: 1).opacity(0.95))
        .cornerRadius(24);
    }
}

#Preview {
    VStack {
        ChatMessageView(message: Message.sampleData[0])
        Spacer()
    }
    .padding()
    .background(Color(red: 0.16, green: 0.18, blue: 0.20).ignoresSafeArea(.all))
}
