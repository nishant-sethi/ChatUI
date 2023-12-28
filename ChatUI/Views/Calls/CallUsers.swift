//
//  CallUsers.swift
//  ChatUI
//
//  Created by Nishant sethi on 29/11/2023.
//

import SwiftUI

struct CallUsers: View {
    var users:[String]
    var body: some View {
        ScrollView(.vertical,showsIndicators: false) {
            VStack {
                ForEach(users,id: \.self) { user in
                    HStack {
                        Image(systemName: "person").resizable()
                            .background( Color("color_bg_inverted").opacity(0.05))
                            .frame(width: 60, height: 60)
                            .clipShape(Circle())
                        VStack(alignment: .leading, spacing: 8) {
                            HStack{
                                Text(user).fontWeight(.semibold).padding(.top,3)
                                Spacer()
                                Text("HH:SS AM").foregroundColor(Color("color_primary")).padding(.top, 3)
                            }
                            HStack {
                                Image(systemName: "arrow.up.right")
                                    .foregroundColor(Color("color_primary"))
                                Text("Outgoing").foregroundColor(Color("color_bg_inverted").opacity(0.5)).lineLimit(3)
                                Divider()
                                    .padding(.top, 8)
                            }
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    CallUsers(users: ["Person 1","Person 2","Person 3","Person 1","Person 2","Person 3"])
}
