//
//  History.swift
//  ChatUI
//
//  Created by Nishant sethi on 25/01/2024.
//

import Foundation

struct History: Identifiable {
    var prompt: String // this will be the ai generated based on the conversation
    var iconName: String
    var description: String
    var messages: [Message]
    var id: UUID
    
    init(prompt: String, iconName: String, description: String, messages: [Message], id: UUID = UUID()) {
        self.prompt = prompt
        self.iconName = iconName
        self.description = description
        self.messages = messages
        self.id = id
    }
}
extension History {
    static let sampleData: [History] = [
        History(prompt: "Act as an Influencer Marketing Strategist", iconName: "pencil", description: "As an influencer marketing strategist, my role is to provide you with suggestions and tips to create a successful influencer marketing campaign. Influencer marketing has become a powerful tool for brands to connect with their target audience and drive engagement. Here are some key recommendations to hel", messages: []),
        History(prompt: "Act as an Influencer Marketing Strategist", iconName: "pencil", description: "As an influencer marketing strategist, my role is to provide you with suggestions and tips to create a successful influencer marketing campaign. Influencer marketing has become a powerful tool for brands to connect with their target audience and drive engagement. Here are some key recommendations to hel", messages: []),
        History(prompt: "Act as an Influencer Marketing Strategist", iconName: "pencil", description: "As an influencer marketing strategist, my role is to provide you with suggestions and tips to create a successful influencer marketing campaign. Influencer marketing has become a powerful tool for brands to connect with their target audience and drive engagement. Here are some key recommendations to hel", messages: []),
        History(prompt: "Act as an Influencer Marketing Strategist", iconName: "pencil", description: "As an influencer marketing strategist, my role is to provide you with suggestions and tips to create a successful influencer marketing campaign. Influencer marketing has become a powerful tool for brands to connect with their target audience and drive engagement. Here are some key recommendations to hel", messages: []),
        History(prompt: "Act as an Influencer Marketing Strategist", iconName: "pencil", description: "As an influencer marketing strategist, my role is to provide you with suggestions and tips to create a successful influencer marketing campaign. Influencer marketing has become a powerful tool for brands to connect with their target audience and drive engagement. Here are some key recommendations to hel", messages: [])
    ]
}
