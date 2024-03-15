//
//  Explore.swift
//  ChatUI
//
//  Created by Nishant sethi on 25/01/2024.
//

import Foundation

struct Explore: Identifiable {
    var name: String;
    var iconName: String;
    var description: String;
    var prompt: String;
    var id: UUID
    
    init(name: String, iconName: String, description: String, prompt: String, id: UUID = UUID()) {
        self.name = name
        self.iconName = iconName
        self.description = description
        self.prompt = prompt
        self.id = id
    }
}

extension Explore {
    static let sampleData: [Explore] = [
        Explore(name: "Business", iconName: "case", description: "Al writing function with advanced input for personalized, high-quality content creation.", prompt: ""),
//        Explore(name: "Writing", iconName: "pencil", description: "Al writing function with advanced input for personalized, high-quality content creation.", prompt: ""),
        Explore(name: "Writing", iconName: "mic", description: "Al writing function with advanced input for personalized, high-quality content creation.", prompt: ""),
        Explore(name: "Interviewing", iconName: "mic", description: "Al writing function with advanced input for personalized, high-quality content creation.", prompt: ""),
        Explore(name: "Grammer", iconName: "doc.questionmark", description: "Al writing function with advanced input for personalized, high-quality content creation.", prompt: ""),
        Explore(name: "Translate", iconName: "textformat.abc.dottedunderline", description: "Al writing function with advanced input for personalized, high-quality content creation.", prompt: "")
    ]
}
