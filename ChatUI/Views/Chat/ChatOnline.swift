//
//  ChatOnline.swift
//  ChatUI
//
//  Created by Nishant sethi on 29/11/2023.
//

import SwiftUI

struct ChatOnline: View {
    var users:[String]
    var body: some View {
        ScrollView(.horizontal,showsIndicators: false) {
            VStack {
                HStack(spacing: 25) {
                    ForEach(users,id: \.self) { user in
                        VStack{
                            Image(systemName: "person").resizable().background(Color("color_bg").opacity(0.1)).frame(width: 60,height: 60).overlay(Circle().stroke(Color("color_primary"),lineWidth: 6)).clipShape(Circle())
                            Text(user).fontWeight(.semibold).padding(.top, 3)
                        }
                    }
                    
                }
            }.padding(.vertical, 10)
           
        }
    }
}

#Preview {
    ChatOnline(users: ["Person 1","Person 2","Person 3","Person 1","Person 2","Person 3"])
}
