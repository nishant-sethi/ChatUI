//
//  ChatUIApp.swift
//  ChatUI
//
//  Created by Nishant sethi on 29/11/2023.
//

import SwiftUI

@main
struct ChatUIApp: App {
    // TODO: Consider injecting this from outside if you plan to use dependency injection.
    let chatViewModel = ChatsViewModel()
    
    var body: some Scene {
        WindowGroup {
            ContentView(searchText: "", chatViewModel: chatViewModel)
        }
        // .onAppear { ... } // Handle any app launch configurations.
        // .onDisappear { ... } // Handle any clean-up if necessary.
    }
}
