//
//  ChatUIView.swift
//  ChatUI
//
//  Created by Nishant sethi on 29/11/2023.
//

import SwiftUI

struct ChatUIView: View {
    
    @ObservedObject var chatViewModel: ChatsViewModel
    
    @Binding var searchText:String
    @State var isDark:Bool
    
    
    let users = ["Person 1","Person 2","Person 3","Person 4","Person 5","Person 6"]
    
    var body: some View {
        NavigationView {
            VStack {
                ChatUIHeader(chatViewModel: chatViewModel)
                    .accessibilityElement(children: .combine) // Combine header elements
                SearchView(searchText: $searchText)
                //                ChatOnline(users: users)
                Divider()
                ChatUsers(chatViewModel: chatViewModel)
                Spacer()
                Divider()
            }
            .navigationTitle("Chats")
            .padding(EdgeInsets(top: 0, leading: 5, bottom: 0, trailing: 5))
        }
        .accessibilityAdjustableAction { direction in
            //TODO: Implement actions for adjustable accessibility, if applicable
        }
    }
}

#Preview {
    let chatViewModel = ChatsViewModel()
    return ChatUIView(chatViewModel: chatViewModel, searchText: .constant(""),isDark: false)
}
