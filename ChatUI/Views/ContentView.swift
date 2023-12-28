//
//  ContentView.swift
//  ChatUI
//
//  Created by Nishant sethi on 29/11/2023.
//

import SwiftUI

struct ContentView: View {
    //TODO: Consider using system theme settings
    @State var isDark: Bool = false
    @State var searchText: String
    @State private var selection: Tab = .conversations
    @ObservedObject var chatViewModel: ChatsViewModel
    
    enum Tab {
        case conversations
        case explore
        case settings
    }
    
    var body: some View {
        TabView {
            ChatUIView(chatViewModel: chatViewModel, searchText: $searchText,isDark: isDark).tabItem {
                Label("Conversations", systemImage: "bubble.left.and.bubble.right")
            }
            .tag(Tab.conversations)
            CallsView(searchText: "").tabItem {
                Label("Explore", systemImage: "globe")
            }
            .tag(Tab.explore)
            SettingsUIView()
                .tabItem {
                    Label("Settings", systemImage: "gear")
                }
                .tag(Tab.settings)
        }
        //        ChatScreen(viewModel: viewModel)
        
    }
}

#Preview {
    let chatViewModel = ChatsViewModel()
    return ContentView(searchText: "", chatViewModel: chatViewModel).preferredColorScheme(.light)
}
