//
//  SearchView.swift
//  ChatUI
//
//  Created by Nishant sethi on 29/11/2023.
//

import SwiftUI

struct SearchView: View {
    @Binding var searchText:String
    
    var body: some View {
        VStack{
            HStack {
                Image(systemName: "magnifyingglass")
                TextField("Search", text: $searchText)
                Button(action: {
                    self.searchText = ""
                }) {
                    Image(systemName: "xmark.circle.fill").opacity(searchText == "" ? 0 : 1)
                }
            } .padding(10)
                .foregroundColor(.secondary)
                .background(Color("color_bg_inverted").opacity(0.05))
                .clipShape(Capsule())
        }.padding(.vertical,5)
        
    }
}

#Preview {
    SearchView(searchText: .constant(""))
}
