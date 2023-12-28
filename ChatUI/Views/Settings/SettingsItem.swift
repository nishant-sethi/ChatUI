//
//  SettingsItem.swift
//  ChatUI
//
//  Created by Nishant sethi on 29/11/2023.
//

import SwiftUI

struct SettingsItem: View {
    var setting:[String : String]
    var body: some View {
        HStack{
            Image(systemName: setting["icon"]!)
                .font(.system(size: 24))
                .foregroundColor(Color("color_primary"))
            
            VStack(alignment: .leading, spacing: 6){
                HStack{
                    Text(setting["title"]!)
                        .fontWeight(.semibold)
                        .padding(.top, 3)
                    Spacer()
                    
                    
                    
                    Image(systemName: "chevron.right")
                        .foregroundColor(Color("color_primary"))
                }
                
                Divider()
                    .padding(.top, 8)
            }
            .padding(.horizontal, 10)
        }
    }
}

#Preview {
    SettingsItem(setting: ["icon":"person","title":"person"])
}
