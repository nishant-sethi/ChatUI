//
//  PromptViewModel.swift
//  ChatUI
//
//  Created by Nishant sethi on 28/01/2024.
//

import SwiftUI

class PromptViewModel: ObservableObject {
    
    @Published var isFetching: Bool = false;
    @Published var messages: [Message] = []
    var token: String = UserDefaults.standard.string(forKey: "apiToken") ?? ""
    private var prompt: String = ""
    
    
    static var staticData: [Message] = Message.sampleData
    
    private var userMessages: [String] = [];
    private var gptResponses: [String] = []
    
    func pushMessage(userMessage: String) {
        self.messages.append(Message(content: userMessage, isUser: true))
    }
    func setAPIKey() async  {
        print(self.token )
        guard !self.token.isEmpty else {
            print("API Key Required")
            return
        }
        /// set api url
        let urlString = "https://calm-coast-87343-200918e427ac.herokuapp.com/set-api-key"
        guard let url = URL(string: urlString) else {
            return
        }
        
        let requestBody: [String: String] = [
            "api_key": self.token,
        ]
        print("\(requestBody)")
        guard let jsonData = try? JSONSerialization.data(withJSONObject: requestBody) else {
            return
        }
        var request = URLRequest(url: url) // prepare request
        request.httpMethod = "POST" // set http method
        request.httpBody = jsonData // set body
        request.addValue("application/json", forHTTPHeaderField: "Content-Type") // set content type
        
        do {
            let (data, _) = try await URLSession.shared.data(for: request)
            print(data)
            if let responseMessage = String(data: data, encoding: .utf8) {
                print(responseMessage) // handle it to show on the ui screen
                
            } else {
                
            }
        } catch {
            print("POST request failed: \(error)")
            // Handle the error appropriately
        }
    }
    func postMessageToGPT(prompt: String) async {
        self.isFetching = true
        self.setPrompt(prompt: prompt)
        guard let userMessage = messages.last?.content else { return } /// get the last pushed message
        print(userMessage)
        
        
        
        //set api url
        let urlString = "https://calm-coast-87343-200918e427ac.herokuapp.com/ask-gpt4"
        guard let url = URL(string: urlString) else {
            self.isFetching = false
            return
        }
        
        //TODO: Prepare your POST request data
        let requestBody: [String: Any] = [
            "system": prompt,
            "user": userMessage
        ]
        print("\(requestBody)")
        
        /// serialise the json object
        guard let jsonData = try? JSONSerialization.data(withJSONObject: requestBody) else {
            self.isFetching = false
            return
        }
        print(jsonData)
        
        var request = URLRequest(url: url) // prepare request
        request.httpMethod = "POST" // set http method
        request.httpBody = jsonData // set body
        request.addValue("application/json", forHTTPHeaderField: "Content-Type") // set content type
        
        do {
            let (data, _) = try await URLSession.shared.data(for: request)
            print(data)
            if let responseMessage = String(data: data, encoding: .utf8) {
                print(responseMessage) // handle it to show on the ui screen
                self.messages.append(Message(content: responseMessage, isUser: false))
            } else {
                self.messages.append(Message(content: "No response received", isUser: false))
            }
        } catch {
            print("POST request failed: \(error)")
            self.messages.append(Message(content: "Something went wrong while fetching response, Please try again", isUser: false))
            
            // Handle the error appropriately
        }
        self.isFetching = false
    }
    private func prepareGPTRequestObject() {
        
    }
    
    func resetUserMessagesList () {
        self.userMessages = []
    }
    func resetGptResponses () {
        self.gptResponses = []
    }
    func resetMessages () {
        self.gptResponses = []
        self.userMessages = []
        self.messages = []
    }
    func setPrompt(prompt:String) {
        self.prompt = prompt
    }
    func resetPrompt() {
        self.prompt = ""
    }
}
