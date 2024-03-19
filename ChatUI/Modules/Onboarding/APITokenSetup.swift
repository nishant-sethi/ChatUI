//
//  APITokenSetup.swift
//  ChatUI
//
//  Created by Nishant sethi on 13/03/2024.
//

import SwiftUI

struct APITokenSetup: View {
    
    @ObservedObject var promptModel: PromptViewModel
    @State var showSafari = false
    @State var urlString = "https://beta.openai.com/account/api-keys"
    @State var token = ""
    @FocusState var textFocused: Bool
    
    
    var body: some View {
        VStack {
            Spacer()
            VStack {
                Text("To use the app, you must setup or generate a token to access the OpenAI API.")
                    .font(.subheadline)
                    .fontWeight(.light)
                    .padding(.horizontal)
                    .padding()
                TextField("API Token", text: $token)
                    .focused($textFocused)
                    .padding()
                    .overlay(
                        RoundedRectangle(cornerRadius: 14)
                            .stroke(Color.secondary, lineWidth: 2))
                    .padding()
                Button(action: {
                    self.urlString = "https://beta.openai.com/account/api-keys"
                    self.showSafari = true
                }) {
                    Text("Get API token")
                }
                .padding(.horizontal)
                Button(action: setAPIToken, label: {
                    Text("Continue")
                        .disabled(token.isEmpty)
                }).buttonStyle(.bordered)
            }
            .padding()
            
            Spacer()
            
            VStack {
                Text("Disclaimer")
                    .font(.title)
                    .fontWeight(.bold)
                Text("This app was not made by OpeanAI. This is an independent and completely free project that connects to OpenAI's public API. The app is not affiliated with OpenAI in any way.")
                    .font(.caption)
                    .fontWeight(.heavy)
                    .foregroundColor(.red)
                    .padding(.top, 1)
            }
            .padding()
        }
        .onTapGesture {
            textFocused = false
        }
        .sheet(isPresented: $showSafari) {
            SafariView(url: URL(string: self.urlString)!)
        }
    }
    private func setAPIToken() {
        UserDefaults.standard.set(token, forKey: "apiToken")
        promptModel.token = token
        Task {
            await promptModel.setAPIKey()
        }
        token = ""
        textFocused = false
    }
}

#Preview {
    APITokenSetup(promptModel: PromptViewModel())
}
