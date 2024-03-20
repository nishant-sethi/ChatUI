//
//  PromptViewModel.swift
//  ChatUI
//
//  Created by Nishant sethi on 28/01/2024.
//

import SwiftUI

@MainActor
class PromptViewModel: ObservableObject {
    
    @Published var isFetching: Bool = false;
    @Published var messages: [Message] = []
    var token: String = UserDefaults.standard.string(forKey: "apiToken") ?? ""
    private var prompt: String = ""
    
    static var staticData: [Message] = Message.sampleData
    
    private var userMessages: [String] = [];
    private var gptResponses: [String] = []
    
    func pushMessage(userMessage: String, isUser: Bool) {
        self.messages.append(Message(content: userMessage, isUser: isUser))
    }
    func setAPIKey() async  {
        print(self.token )
        guard !self.token.isEmpty else {
            print("API Key Required")
            return
        }
        /// set api url
        let urlString = APIUtils.APIConstants.setAPIKey
        let requestBody: [String: String] = [
            "api_key": self.token,
        ]
        print("\(requestBody)")
        let _ = await APIUtils.postRequest(urlString: urlString, requestBody: requestBody)
    }
    func postMessageToGPT(prompt: String) async {
        
        isFetching = true
        guard let userMessage = messages.last?.content else { return }
        self.setPrompt(prompt: prompt)
        isFetching = true
        let requestBody: [String: Any] = ["system": prompt, "user": userMessage]
        let result = await APIUtils.postRequest(urlString: APIUtils.APIConstants.askGPT, requestBody: requestBody)
        handleNetworkResult(result)
        
        isFetching = false
    }
    
    func resetMessages () {
        self.gptResponses = []
        self.userMessages = []
        self.messages = []
    }
    func setPrompt(prompt:String) {
        self.prompt = prompt
    }
    
    private func handleNetworkResult(_ result: Result<String, Error>) {
        switch result {
            case .success(let message):
                pushMessage(userMessage: message, isUser: false)
            case .failure(let error):
                print("Request failed: \(error)")
                pushMessage(userMessage: "An error occurred: \(error.localizedDescription)",isUser: false)
        }
    }
}

