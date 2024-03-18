//
//  SectionNavigationArrow.swift
//  ChatUI
//
//  Created by Nishant sethi on 27/01/2024.
//

import SwiftUI

struct SectionNavigationArrow: View {
    var body: some View {
        Image(systemName: "arrow.right")
            .foregroundStyle(.black)
            .background {
                Circle()
                    .foregroundStyle(.clear)
                    .background(.white)
                    .frame(width: 40,height: 40)
                    .clipShape(Circle())
            }
    }
}

#Preview {
    SectionNavigationArrow()
}
