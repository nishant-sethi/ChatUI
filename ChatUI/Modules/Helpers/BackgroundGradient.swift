//
//  BackgroundGradient.swift
//  ChatUI
//
//  Created by Nishant sethi on 19/01/2024.
//

import SwiftUI

struct BackgroundGradient: View {
    var from: Color
    var to: Color
    var body: some View {
        LinearGradient(
            gradient: Gradient(colors: [from, to]),
            startPoint: .bottom,
            endPoint: .top
        )
        .edgesIgnoringSafeArea(.all)
    }
}

#Preview {
    BackgroundGradient(from: Color(red: 0.42, green: 0.75, blue: 0.73), to: Color(red: 0, green: 0.15, blue: 0.33).opacity(0.8))
}
