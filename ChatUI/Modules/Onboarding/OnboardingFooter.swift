//
//  OnboardingFooter.swift
//  ChatUI
//
//  Created by Nishant sethi on 19/01/2024.
//

import SwiftUI

struct OnboardingFooter: View {
    var body: some View {
        VStack {
            HStack(spacing: 8) {
                Button("Login") { }
                .buttonStyle(PrimaryButtonStyle(width: 157, height: 52))
                Button("Sign up") { }
                .buttonStyle(SecondaryButtonStyle())
            }
            .offset(y: 347)
        }
        .padding()
    }
}

#Preview {
    OnboardingFooter()
}
