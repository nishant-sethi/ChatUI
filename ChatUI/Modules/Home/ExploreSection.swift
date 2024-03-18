//
//  ExploreSection.swift
//  ChatUI
//
//  Created by Nishant sethi on 24/01/2024.
//

import SwiftUI

struct ExploreSection: View {
    @ObservedObject var promptVM: PromptViewModel
    var body: some View {
        GeometryReader { geometry in
            VStack{
                HStack {
                    Text("Explore more")
                        .font(.custom("Satoshi", size: 24).weight(.medium))
                        .foregroundColor(.white)
                    Spacer()
                    NavigationLink(destination: ExploreView(exploreItems: Explore.sampleData)) {
                        SectionNavigationArrow()
                    }
                }
                .padding(.trailing)
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing:20) {
                        ForEach(Explore.sampleData) { exploreItem in
                            NavigationLink(destination: Chat(promptVM: promptVM, historyVM: HistoryViewModel(), history: History.sampleData[0])) {
                                ExploreItem(exploreItem: exploreItem)
                                    .frame(width: geometry.size.width/3 - 20)
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
        ExploreSection(promptVM: PromptViewModel())
    }
}
