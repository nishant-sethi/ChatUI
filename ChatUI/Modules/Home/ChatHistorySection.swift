//
//  ChatHistorySection.swift
//  ChatUI
//
//  Created by Nishant sethi on 24/01/2024.
//

import SwiftUI

struct ChatHistorySection: View {
    @ObservedObject var promptVM: PromptViewModel
    @ObservedObject var historyVM: HistoryViewModel
    var body: some View {
        GeometryReader { geometry in
            VStack {
                HStack {
                    Text("Chat History")
                        .font(.custom("Satoshi", size: 24).weight(.medium))
                        .foregroundColor(.white)
                    Spacer()
                    NavigationLink(destination: HistoryView(promptVM: promptVM, historyItems: historyVM.history)) {
                        SectionNavigationArrow()
                    }
                }
                .padding(.trailing)
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 20) {
                        ForEach(historyVM.history) { item in
                            NavigationLink(destination: Chat(promptVM: promptVM, historyVM: historyVM,history: item)) {
                                Text(item.prompt)
                                    .font(.custom("Satoshi", size: 12).weight(.medium))
                                    .foregroundColor(Color(red: 0.09, green: 0.09, blue: 0.09))
                                    .frame(width: geometry.size.width/3 - 20, alignment: .leading)
                                    .padding(EdgeInsets(top: 13, leading: 24, bottom: 13, trailing: 24))
                                    .background(Color(red: 0.88, green: 0.88, blue: 0.88))
                                    .cornerRadius(50)
                            }
                            
                        }
                    }
                    .padding(.top)
                }
            }
            .padding([.leading,.trailing])
            .frame(width: geometry.size.width, height: geometry.size.height)
            
        }
    }
}

#Preview {
    ZStack {
        BackgroundGradient(from: Color(red: 0.42, green: 0.75, blue: 0.73), to: Color(red: 0, green: 0.15, blue: 0.33).opacity(0.8))
        ChatHistorySection(promptVM: PromptViewModel(), historyVM: HistoryViewModel())
    }
    
}
