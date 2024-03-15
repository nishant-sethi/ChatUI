//
//  PromptLibrarySection.swift
//  ChatUI
//
//  Created by Nishant sethi on 24/01/2024.
//

import SwiftUI

struct PromptLibrarySection: View {
    @Environment(PromptModelData.self) var promptModelData
    @ObservedObject var promptVM: PromptViewModel
    var body: some View {
        GeometryReader { geometry in
            VStack {
                HStack {
                    Text("Prompt Library")
                        .font(Font.custom("Satoshi", size: 24).weight(.medium))
                        .foregroundColor(.white)
                    Spacer()
                    NavigationLink(destination: PromptCategoryHome(promptVM: promptVM)) {
                        SectionNavigationArrow()
                    }
                    
                }
                .padding(.trailing)
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing:20) {
                        // showing featured apps
                        ForEach(promptModelData.features) { prompt in
                            NavigationLink(destination: Chat(promptVM: promptVM, historyVM: HistoryViewModel(), title: prompt.act, prompt: prompt.prompt)) {
                                Text(prompt.act)
                                    .font(.custom("Satoshi", size: 12).weight(.medium))
                                    .foregroundColor(.white)
                                    .frame(width: geometry.size.width/3 - 20, alignment: .center)
                                    .padding(EdgeInsets(top: 13, leading: 24, bottom: 13, trailing: 24))
                                    .background(BackgroundGradient(from: prompt.from, to: prompt.to))
                                    .cornerRadius(22)
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 22)
                                            .inset(by: 0.50)
                                            .stroke(Color(red: 0.92, green: 0.92, blue: 0.92), lineWidth: 0.50)
                                    )
                            }
//                            .navigationTitle(prompt.act)
                        }
                    }
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
        PromptLibrarySection(promptVM: PromptViewModel())
            .environment(PromptModelData())
    }
}
