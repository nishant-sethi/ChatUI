//
//  NewChatSection.swift
//  ChatUI
//
//  Created by Nishant sethi on 27/01/2024.
//

import SwiftUI

struct NewChatSection: View {
    var body: some View {
        HStack {
            Spacer()
            Text("New Chat")
                .font(Font.custom("Satoshi", size: 16).weight(.medium))
                .foregroundColor(Color(red: 0.09, green: 0.09, blue: 0.09))
            Spacer()
        }
        .padding(EdgeInsets(top: 14, leading: 14, bottom: 14, trailing: 14))
        .background(.white)
        .cornerRadius(25)
        .shadow(
            color: Color(red: 0.81, green: 0.82, blue: 0.78, opacity: 0.50), radius: 16
        )
        .padding()
    }
}

#Preview {
    NewChatSection()
}
