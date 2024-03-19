//
//  HistoryViewModel.swift
//  ChatUI
//
//  Created by Nishant sethi on 03/03/2024.
//

import SwiftUI

@MainActor
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
            history[index].messages.append(contentsOf: messages)
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
        let messagesList = messages.map { $0.content }.joined(separator: ",")
        let requestBody: [String: Any] = ["user_messages": messagesList]
        
        let result = await APIUtils.postRequest(urlString: APIUtils.APIConstants.getTitle, requestBody: requestBody)
        switch result {
            case .success(let context):
                updateHistory(context, messages, historyId)
            case .failure(let error):
                print("POST request failed: \(error)")
        }
    }
}
