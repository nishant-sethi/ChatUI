//
//  SettingsUIHeader.swift
//  ChatUI
//
//  Created by Nishant sethi on 29/11/2023.
//

import SwiftUI

struct SettingsUIHeader: View {
    var body: some View {
            HStack{
                Image(systemName: "person")
                    .resizable()
                    .background( Color("color_bg_inverted").opacity(0.05))
                    .frame(width: 80, height: 80)
                    .clipShape(Circle())
                VStack(alignment: .leading, spacing: 6){
                    HStack{
                        Text("nsethi610")
                            .fontWeight(.semibold)
                            .padding(.top, 3)
                        Spacer()
                    }
                    
                    HStack{
                        Text("ns.fake@fakeid.com")
                            .foregroundColor(Color("color_bg_inverted").opacity(0.5))
                            .lineLimit(2)
                    }
                    
                    Divider()
                        .padding(.top, 8)
                }
                .padding(.horizontal, 10)
            }
            .padding(.vertical, 20)
        }
}

#Preview {
    SettingsUIHeader()
}
