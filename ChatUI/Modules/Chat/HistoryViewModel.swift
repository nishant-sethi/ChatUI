//
//  HistoryViewModel.swift
//  ChatUI
//
//  Created by Nishant sethi on 03/03/2024.
//

import SwiftUI

class HistoryViewModel: ObservableObject {
    @Published var history: [History] = []
    
    func createNewHistory(_ context: String, _ messages: [Message]) {
        let newHistory = History(prompt: context, iconName: "", description: "", messages: messages)
        print("\(newHistory)")
        self.history.append(newHistory)
        print("History created.")
    }
    
    //MARK: code not working properly. check the new chat and update chat flow again.
    func updateHistory(_ context:String, _ messages: [Message], _ historyId:UUID?) {
        if let index = history.firstIndex(where: {$0.id == historyId}) {
            for message in messages {
                history[index].messages.append(message)
            }
        } else {
            let newHistory = History(prompt: context, iconName: "", description: "", messages: messages)
            print("\(newHistory)")
            self.history.append(newHistory)
            print("History created.")
        }
    }
    func fetchHistory() -> [History]{
        self.history
    }
    
    func getContextFromConversation(_ messages: [Message], _ historyId: UUID?) async {
        let urlString = "https://calm-coast-87343-200918e427ac.herokuapp.com/get-context"
        let messagesList = messages.map { $0.content }.joined(separator: ",")
        let requestBody: [String: Any] = [
            "user_messages": messagesList
        ]
        print("\(requestBody)")
        guard let url = URL(string: urlString) else {
            return
        }
        guard let jsonData = try? JSONSerialization.data(withJSONObject: requestBody) else {
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.httpBody = jsonData
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        do {
            let (data, _) = try await URLSession.shared.data(for: request)
            print(data)
            if let responseMessage = String(data: data, encoding: .utf8) {
                print(responseMessage) // handle it to show on the ui screen
                self.updateHistory(responseMessage, messages,historyId)
            } else {
                //                self.messages.append(Message(content: "No response received", isUser: false))
                return
            }
        } catch {
            print("POST request failed: \(error)")
            //            self.messages.append(Message(content: "Something went wrong while fetching response, Please try again", isUser: false))
            return
            
            // Handle the error appropriately
        }
    }
}
