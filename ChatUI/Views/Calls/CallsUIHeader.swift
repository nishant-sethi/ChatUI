//
//  CallsUIHeader.swift
//  ChatUI
//
//  Created by Nishant sethi on 29/11/2023.
//

import SwiftUI

struct CallsUIHeader: View {
    var body: some View {
        HStack {
            Text("Calls").fontWeight(.semibold).font(.largeTitle)
            Spacer()
            Image(systemName: "phone.badge.plus").foregroundColor(Color("color_primary")).font(.title2)
        }
    }
}

#Preview {
    CallsUIHeader()
}
