//
//  OnboardingHeader.swift
//  ChatUI
//
//  Created by Nishant sethi on 19/01/2024.
//

import SwiftUI

struct OnboardingHeader: View {
    var body: some View {
        Text("Explore infinite capabilities of writing")
            .font(.custom("Satoshi", size: 64))
            .foregroundColor(Color.white.opacity(0.90))
            .offset(y: -153)
            .padding()
    }
}

#Preview {
    ZStack{
        LinearGradient(
            gradient: Gradient(colors: [Color(red: 0.42, green: 0.75, blue: 0.73),
                                        Color(red: 0, green: 0.15, blue: 0.33).opacity(0.8)]),
            startPoint: .top,
            endPoint: .bottom
        )
        .edgesIgnoringSafeArea(.all)
        OnboardingHeader()
    }
}
