//
//  ChatsViewModel.swift
//  ChatUI
//
//  Created by Nishant sethi on 08/12/2023.
//

import SwiftUI

class ChatsViewModel: ObservableObject {
    
    @Published private var model: Conversations = Conversations()
    @Published var isFetching = false
    @Published var prompt: String = ""
    
    var conversations: Array<Conversations.Conversation> {
        model.getAllConversation()
    }
    func createNewConveration(prompt: String) {
        model.createConversation(prompt: prompt)
    }
    func addMessageToConversation(id:UUID, message: String, isUser: Bool) {
        model.addMessageToConversation(id: id, message: message, isUser: isUser)
    }
    func getConversationById(id:UUID) -> Conversations.Conversation? {
        model.getConversationById(id: id)
    }
    func deleteAllConversations() {
        // TODO: Delete all conversations
        return
    }
    func deleteConversationsById(id:UUID) {
        // TODO: Delete conversatin by id
        print("deleted called")
        return
    }
    func postMessageToNetwork(id:UUID)  {
        model.addMessageToConversation(id: id, message: "Message from bot", isUser: false)
    }
    func postMessageToGPT(id:UUID) async {
        guard let conversation = getConversationById(id: id) else { return }
        let prompt:String = conversation.getPrompt()
        guard let userMessage = conversation.messages.last?.content else { return }
        
        self.isFetching = true
        
        let urlString = "add your gpt url"
        guard let url = URL(string: urlString) else {
            self.isFetching = false
            return
        }
        print(prompt)
        //TODO: Prepare your POST request data
        let requestBody: [String: Any] = [
            "system": "",
            "user": ""
        ]
        print("\(requestBody)")
        
        guard let jsonData = try? JSONSerialization.data(withJSONObject: requestBody) else {
            self.isFetching = false
            return
        }
        print(jsonData)
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.httpBody = jsonData
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        do {
            let (data, _) = try await URLSession.shared.data(for: request)
            print(data)
            if let responseMessage = String(data: data, encoding: .utf8) {
                self.addMessageToConversation(id: id, message: responseMessage, isUser: false)
            } else {
                self.addMessageToConversation(id: id, message: "No response received", isUser: false)
            }
        } catch {
            print("POST request failed: \(error)")
            self.addMessageToConversation(id: id, message: "Something went wrong while fetching response, Please try again", isUser: false)
            
            // Handle the error appropriately
        }
        self.isFetching = false
    }
}

