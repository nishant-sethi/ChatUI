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
//    let chatViewModel = ChatsViewModel()
    let promotViewModel = PromptViewModel()
    let historyViewModel = HistoryViewModel()
    @State private var promptModelData = PromptModelData()
    @AppStorage("apiToken") var apiToken:String = ""
    
    var body: some Scene {
        WindowGroup {
            if apiToken.isEmpty {
                APITokenSetup(promptModel: promotViewModel)
            } else {
                //            ContentView(searchText: "", chatViewModel: chatViewModel)
                //            OnboardingView()
                Main(promptVM: promotViewModel, historyVM: historyViewModel)
                    .environment(promptModelData)
                // .onAppear { ... } // Handle any app launch configurations.
                // .onDisappear { ... } // Handle any clean-up if necessary.
            }
        }
        
    }
}
