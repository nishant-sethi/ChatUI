//
//  Main.swift
//  ChatUI
//
//  Created by Nishant sethi on 24/01/2024.
//

import SwiftUI

struct Main: View {
    @EnvironmentObject var promptVM: PromptViewModel
    @EnvironmentObject var historyVM: HistoryViewModel
    
    var body: some View {
        TabView {
            NavigationStack {
                Chat()
            }
            .tabItem {
                Label("Home", systemImage: "brain")
            }
            .tag(Tab.chat)
            
            NavigationStack {
                PromptCategoryHome()
            }
            .tabItem {
                Label("Prompt Library", systemImage: "books.vertical.circle")
            }
            .tag(Tab.library)
            
            NavigationStack {
                HistoryView(promptVM: promptVM, historyItems: historyVM.history)
            }
            .tabItem {
                Label("History", systemImage: "note.text")
            }
            .tag(Tab.history)
            
            NavigationStack {
                ExploreView(exploreItems: Explore.sampleData)
            }
            .tabItem {
                Label("Explore", systemImage: "globe")
            }
            .tag(Tab.explore)
        }
        .background(Color(red: 0.16, green: 0.18, blue: 0.20))
        
    }
    
    
}
enum Tab {
    case chat
    case library
    case history
    case explore
}


#Preview {
    Main()
        .environmentObject(PromptViewModel())
        .environmentObject(HistoryViewModel())
}
