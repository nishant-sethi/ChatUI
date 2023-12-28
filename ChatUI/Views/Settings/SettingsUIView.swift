//
//  SettingsUIView.swift
//  ChatUI
//
//  Created by Nishant sethi on 29/11/2023.
//

import SwiftUI

struct SettingsUIView: View {
    var settings = [["icon":"person","title":"Account"],["icon":"bell","title":"Notifications"],["icon":"lock","title":"Privacy & Security"]]
    var body: some View {
        ZStack {
            Color("color_bg").edgesIgnoringSafeArea(.all)
            VStack {
                HStack{
                    Text("Settings")
                        .fontWeight(.semibold)
                        .font(.largeTitle)
                    Spacer()
                }
                ScrollView {
                    SettingsUIHeader()
                    ForEach(settings,id: \.self) { setting in
                        SettingsItem(setting: setting)
                        .padding(.vertical, 10)
                    }
                }
                .padding(.vertical, 10)
            } .padding(.horizontal)
        }
    }
}


#Preview {
    SettingsUIView()
}
