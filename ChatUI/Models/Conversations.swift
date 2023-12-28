//
//  Conversations.swift
//  ChatUI
//
//  Created by Nishant sethi on 10/12/2023.
//

import Foundation

struct Conversations {
    
    private(set) var conversations: Array<Conversation>
    
    init() {
        conversations = []
    }
    mutating func createConversation(prompt: String){
        let message = Conversation.Message(content: prompt, isUser: true)
        let conversation = Conversation(messages: [message], prompt: prompt)
        conversations.append(conversation)
    }
    func getAllConversation() -> Array<Conversation> {
        conversations
    }
    func getConversationById(id: UUID) -> Conversation? {
        conversations.first(where: { $0.id == id })
    }
    mutating func addMessageToConversation(id: UUID, message: String, isUser: Bool) {
        if let index = conversations.firstIndex(where: { $0.id == id }) {
            conversations[index].addMessageToConversation(message, isUser)
        }
//        func index(_ id: UUID) -> UUID {
//            for index in conversations.indices {
//                if conversations[index].id == id {
//                    return id
//                }
//            }
//        }
//        conversations[index(id)].addMessageToConversation(message, isUser)
    }
    struct Conversation: Identifiable {
        private(set) var messages: Array<Message>
        private var prompt:String
        private var timestamp: Date = Date()
        var id: UUID = UUID()
        
        init(messages: Array<Message>, prompt: String) {
            self.messages = messages
            self.prompt = prompt
        }
        mutating func addMessageToConversation(_ message: String, _ isUser: Bool) {
            let newMessage = Message(content: message, isUser: isUser)
            messages.append(newMessage)
            timestamp = Date()  // Update timestamp whenever a new message is added
        }
        func getPrompt() -> String {
            prompt
        }
        
        struct Message:Identifiable, CustomDebugStringConvertible {
            
            var id: UUID = UUID()
            var content: String
            var isUser: Bool
            var timestamp: Date = Date()
            
            var debugDescription: String {
                "id: \(id), content: \(content), isUser: \(isUser), timestamp: \(timestamp)"
            }
            
        }
    }
}
