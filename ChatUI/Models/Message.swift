//
//  Message.swift
//  ChatUI
//
//  Created by Nishant sethi on 28/01/2024.
//

import Foundation

struct ConversationsV2 {
    private (set) var conversations: Array<ConversationV2>
    init(){
        self.conversations = []
    }
    
    func getAllConversation() -> Array<ConversationV2> {
        conversations
    }
    func getConversationById(id: UUID) -> ConversationV2? {
        conversations.first(where: { $0.id == id })
    }
}
struct ConversationV2: Identifiable {
    private(set) var messages: Array<Message>
    private var timestamp = Date()
    private var context: String = ""
    var id = UUID()
    
    init(messages: Array<Message>) {
        self.messages = messages
    }
    mutating func setContext(_ context: String) {
        self.context = context
    }
    mutating func addMessageToConv(_ message:String, _ isUser: Bool){
        let message = Message(content: message, isUser: isUser)
        self.messages.append(message)
        self.timestamp = Date()
    }
}

struct Message:Identifiable, CustomDebugStringConvertible {
    
    var content: String
    var isUser: Bool
    var timestamp: Date = Date()
    var id: UUID;
    
    init(content: String, isUser: Bool,id: UUID = UUID()) {
        self.content = content
        self.isUser = isUser
        self.id = id
    }
    var debugDescription: String {
        "id: \(id), content: \(content), isUser: \(isUser), timestamp: \(timestamp)"
    }
    
}

extension Message {
    static let sampleData: [Message] = [
        Message(content: "What can you do?", isUser: true),
        Message(content: "Mauris mattis at urna a elementum. Sed id fringilla diam. In hac habitasse platea dictumst. Maecenas ut egestas massa. Donec aliquam diam a sapien tincidunt, quis mattis lectus varius. Nulla elementum ipsum nulla, et sodales lorem euismod vel. Morbi id commodo nunc. Duis id vehicu", isUser: false),
        Message(content: "How is the weather looking today?", isUser: true),
        Message(content: "Mauris mattis at urna a elementum. Sed id fringilla diam. In hac habitasse platea dictumst. Maecenas ut egestas massa. Donec aliquam diam a sapien tincidunt, quis mattis lectus varius. Nulla elementum ipsum nulla, et sodales lorem euismod vel. Morbi id commodo nunc. Duis id vehicu", isUser: false)
    ]
}
