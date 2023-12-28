//
//  CallsView.swift
//  ChatUI
//
//  Created by Nishant sethi on 29/11/2023.
//

import SwiftUI

struct CallsView: View {
    
    @State var searchText:String
    let users = ["Person 1","Person 2","Person 3","Person 4","Person 5","Person 6"]
    
    var body: some View {
        ZStack {
            Color("color_bg").edgesIgnoringSafeArea(.all)
            Spacer()
            VStack {
                CallsUIHeader()
                SearchView(searchText: $searchText)
                CallUsers(users: users)
            }.padding(.horizontal)
        }
    }
}

#Preview {
    CallsView(searchText: "")
}
