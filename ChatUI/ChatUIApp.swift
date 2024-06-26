//
//  ChatUIApp.swift
//  ChatUI
//
//  Created by Nishant sethi on 29/11/2023.
//

import SwiftUI

@main
struct ChatUIApp: App {
    @StateObject private var promptViewModel = PromptViewModel()
    @StateObject private var historyViewModel = HistoryViewModel()
    @StateObject private var promptModelData = PromptModelData()
    
    @AppStorage("apiToken") private var apiToken: String = ""
    
    var body: some Scene {
        WindowGroup {
            contentView
        }
    }
    
    @ViewBuilder
    private var contentView: some View {
        if apiToken.isEmpty {
            APITokenSetup(promptModel: promptViewModel)
        } else {
            Main()
                .environmentObject(promptModelData)
                .environmentObject(promptViewModel)
                .environmentObject(historyViewModel)
                .onAppear {
                    Task {
                        await promptViewModel.setAPIKey()
                    }
                }
        }
    }
}

