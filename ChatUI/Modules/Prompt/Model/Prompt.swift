//
//  Prompt.swift
//  ChatUI
//
//  Created by Nishant sethi on 26/01/2024.
//

import Foundation
import SwiftUI

struct Prompt: Hashable,Codable, Identifiable {
    
    var act: String;
    var Category: String;
    var Subcategory: String;
    var Description: String?;
    var prompt: String;
    var id: Int;
    
    var from: Color {
        PromptBGColor.from(Category.trimmingCharacters(in: .whitespaces))
    }
    var to: Color {
        PromptBGColor.to(Category.trimmingCharacters(in: .whitespaces))
    }
    
    var isFavorite: Bool
    var isFeatured: Bool
}

extension Prompt {
    
}
//extension Prompt {
//    static let sampleData: [Prompt] = [
//        Prompt(act: "Linux Terminal", category: "Technology and Development", subCategory: "Programming and Coding", description: "Provides a virtual Linux command-line interface", prompt: "I want you to act as a linux terminal. I will type commands and you will reply with what the terminal should show. I want you to only reply with the terminal output inside one unique code block, and nothing else. do not write explanations. do not type commands unless I instruct you to do so. when i need to tell you something in english, i will do so by putting text inside curly brackets {like this}."),
//        Prompt(act: "JavaScript Console", category: "Technology and Development", subCategory: "Programming and Coding", description: "Simulates a JavaScript coding environment", prompt: "I want you to act as a javascript console. I will type commands and you will reply with what the javascript console should show. I want you to only reply with the terminal output inside one unique code block, and nothing else. do not write explanations. do not type commands unless I instruct you to do so. when i need to tell you something in english, i will do so by putting text inside curly brackets {like this}."),
//        Prompt(act: "Python interpreter", category: "Technology and Development", subCategory: "Programming and Coding", description: "Runs Python code and scripts", prompt: "I want you to act like a Python interpreter. I will give you Python code, and you will execute it. Do not provide any explanations. Do not respond with anything except the output of the code."),
//        Prompt(act: "Regex Generator", category: "Technology and Development", subCategory: "Programming and Coding", description: "Generates regular expressions for pattern matching", prompt: "I want you to act as a regex generator. Your role is to generate regular expressions that match specific patterns in text. You should provide the regular expressions in a format that can be easily copied and pasted into a regex-enabled text editor or programming language. Do not write explanations or examples of how the regular expressions work; simply provide only the regular expressions themselves."),
//        Prompt(act: "R programming Interpreter", category: "Technology and Development", subCategory: "Programming and Coding", description: "Executes R code for statistical computing.", prompt: "I want you to act as a R interpreter. I'll type commands and you'll reply with what the terminal should show. I want you to only reply with the terminal output inside one unique code block, and nothing else. Do not write explanations. Do not type commands unless I instruct you to do so. When I need to tell you something in english, I will do so by putting text inside curly brackets {like this}."),
//    ]
//}
