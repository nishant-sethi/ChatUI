//
//  Onboarding.swift
//  ChatUI
//
//  Created by Nishant sethi on 10/01/2024.
//

import SwiftUI

import SwiftUI

struct OnboardingView: View {
    var body: some View {
        ZStack {
            BackgroundGradient(from: Color(red: 0.42, green: 0.75, blue: 0.73), to: Color(red: 0, green: 0.15, blue: 0.33).opacity(0.8))
            VStack(alignment: .leading, spacing: 8) {
                FeaturedCard(text: "Remembers what user said earlier in the conversation")
                FeaturedCard(text: "Allows user to provide follow-up corrections")
                FeaturedCard(text: "Trained to decline inappropriate requests")
            }
            .offset(y: 150)
            paginationIndicator
            OnboardingHeader()
            OnboardingFooter()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
        
    private var paginationIndicator: some View {
        RoundedRectangle(cornerRadius: 96.15)
            .fill(Color.white)
            .frame(width: 134, height: 4.81)
            .offset(y: 389.65)
    }
    
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
    }
}
