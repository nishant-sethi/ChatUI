//
//  Main.swift
//  ChatUI
//
//  Created by Nishant sethi on 24/01/2024.
//

import SwiftUI

import SwiftUI

struct Main: View {
    @ObservedObject var promptVM: PromptViewModel
    @ObservedObject var historyVM: HistoryViewModel
    var body: some View {
        NavigationStack {
            ZStack {
                TabView {
                    Group{
                        Chat(promptVM: promptVM, historyVM: historyVM).tabItem {
                            Label("Home", systemImage: "brain")
                        }.tag(Tab.chat)
                        PromptCategoryHome(promptVM: promptVM).tabItem {
                            Label("Prompt Library", systemImage: "books.vertical.circle")
                        }.tag(Tab.library)
                        HistoryView(promptVM: promptVM, historyItems: historyVM.history).tabItem {
                            Label("History", systemImage: "note.text")
                        }.tag(Tab.history)
                        ExploreView(exploreItems: Explore.sampleData).tabItem {
                            Label("Explore", systemImage: "globe")
                        }.tag(Tab.explore)
                    }
                }
                .background(Color(red: 0.16, green: 0.18, blue: 0.20))
            }
            
        }
    }
    enum Tab {
        case chat
        case library
        case history
        case explore
    }
}


#Preview {
    Main(promptVM: PromptViewModel(), historyVM: HistoryViewModel())
        .environment(PromptModelData())
    //        .environment(HistoryViewModel())
}
