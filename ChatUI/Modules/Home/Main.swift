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
            //            Grid {
            //                GridRow {
            //                    MainHeader()
            //                }
            //                GridRow {
            //                    NavigationLink(destination: Chat(promptVM: promptVM, historyVM: historyVM)) {
            //                        NewChatSection()
            //                    }
            //                }
            //                GridRow {
            //                    withAnimation {
            //                        ChatHistorySection(promptVM: promptVM, historyVM: historyVM)
            //                    }
            //                }
            ////                Spacer()
            //                GridRow {
            //                    ExploreSection(promptVM: promptVM)
            //                }
            //                GridRow {
            //                    PromptLibrarySection(promptVM: promptVM)
            //                }
            //            }
            
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
                            Label("History", systemImage: "globe")
                        }.tag(Tab.history)
                        ExploreView(exploreItems: Explore.sampleData).tabItem {
                            Label("Explore", systemImage: "globe")
                        }.tag(Tab.explore)
                    }
                    
                }
//                                .frame(maxWidth:.infinity,maxHeight:.infinity)
                .background(Color(red: 0.16, green: 0.18, blue: 0.20))
//                VStack {
//                    
//                    HStack {
//                        Spacer() // Pushes the button to the right
//                        NavigationLink(destination: Chat(promptVM: promptVM, historyVM: historyVM)) {
//                            Image(systemName: "plus.app")
//                                .resizable()
//                                .scaledToFit()
//                                .frame(width: 40.0, height: 40.0) // Adjust the size as needed
//                                .foregroundColor(.white)
//                        }
////                        .padding(.trailing, 20) // Adds padding on the right
////                        .padding(28.0) // Adds padding at the bottom
//                    }
//                    Spacer() // Pushes the button to the bottom
//                }
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
