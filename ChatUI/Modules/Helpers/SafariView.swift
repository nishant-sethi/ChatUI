//
//  SafariView.swift
//  ChatUI
//
//  Created by Nishant sethi on 13/03/2024.
//

import SwiftUI

import SwiftUI
import SafariServices

struct SafariView: UIViewControllerRepresentable {

    let url: URL

    func makeUIViewController(context: UIViewControllerRepresentableContext<SafariView>) -> SFSafariViewController {
        return SFSafariViewController(url: url)
    }

    func updateUIViewController(_ uiViewController: SFSafariViewController, context: UIViewControllerRepresentableContext<SafariView>) {

    }

}

#Preview {
    SafariView(url: URL(string: "https://beta.openai.com/account/api-keys")!)
}
