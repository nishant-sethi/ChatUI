//
//  MainHeader.swift
//  ChatUI
//
//  Created by Nishant sethi on 24/01/2024.
//

import SwiftUI

struct MainHeader: View {
    var body: some View {
        HStack(alignment: .top) {
            VStack(alignment: .leading) {
                Group {
                    Text("Good Morning")
                        .multilineTextAlignment(.leading)
                    Text("Nishant")
                        .foregroundColor(.white)
                        .multilineTextAlignment(.leading)
                }
                .font(Font.custom("Satoshi", size: 28).weight(.bold))
                .foregroundColor(Color(red: 0.65, green: 0.73, blue: 0.53))
                
            }
            Spacer()
            Image(systemName: "person.circle")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .foregroundColor(.white)
                .frame(width: 62, height: 62)
        }
        .padding()
    }
}

#Preview {
    ZStack {
        BackgroundGradient(from: Color(red: 0.42, green: 0.75, blue: 0.73), to: Color(red: 0, green: 0.15, blue: 0.33).opacity(0.8))
        MainHeader()
    }
}
