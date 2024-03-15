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
            Grid {
                GridRow {
                    MainHeader()
                }
                GridRow {
                    NavigationLink(destination: Chat(promptVM: promptVM, historyVM: historyVM)) {
                        NewChatSection()
                    }
                }
                GridRow {
                    withAnimation {
                        ChatHistorySection(promptVM: promptVM, historyVM: historyVM)
                    }
                }
                Spacer()
//                GridRow {
//                    ExploreSection(promptVM: promptVM)
//                }
//                GridRow {
//                    PromptLibrarySection(promptVM: promptVM)
//                }
            }
            .frame(maxWidth:.infinity,maxHeight:.infinity)
            .background(Color(red: 0.16, green: 0.18, blue: 0.20))
        }
    }
}


#Preview {
    Main(promptVM: PromptViewModel(), historyVM: HistoryViewModel())
        .environment(PromptModelData())
//        .environment(HistoryViewModel())
}
