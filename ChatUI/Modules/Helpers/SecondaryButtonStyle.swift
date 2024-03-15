//
//  SecondaryButtonStyle.swift
//  ChatUI
//
//  Created by Nishant sethi on 19/01/2024.
//

import SwiftUI

struct SecondaryButtonStyle: ButtonStyle {
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .font(.custom("Satoshi", size: 14).weight(.medium))
            .padding()
            .frame(width: 157, height: 52)
            .background(Color.black)
            .foregroundStyle(.white)
            
            .cornerRadius(50)
            .shadow(color: Color.gray.opacity(0.5), radius: 16)
        
    }
}
