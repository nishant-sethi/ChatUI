//
//  PromptData.swift
//  ChatUI
//
//  Created by Nishant sethi on 30/01/2024.
//

import Foundation
//import SwiftUI

@Observable
class PromptModelData {
    var prompts: [Prompt] = load("prompts.json")
    var categories: [String: [Prompt]] = [:]
    var features: [Prompt] {
        prompts.filter { $0.isFeatured }
    }
    var categoriesForFilter: [String: [Prompt]] = [:]
    init() {
        updateCategories()
        self.categoriesForFilter = self.categories
    }
    // Call this function to update categories, with a default parameter to include all categories
    func updateCategories(filteredCategories: [String]? = nil) {
        if let filteredCategories = filteredCategories {
            let filteredPrompts = prompts.filter { prompt in
                filteredCategories.contains(prompt.Category)
            }
            self.categories = Dictionary(
                grouping: filteredPrompts,
                by: { $0.Category }
            )
        } else {
            // If no filter is provided, include all categories
            self.categories = Dictionary(
                grouping: prompts,
                by: { $0.Category }
            )
        }
    }
}

func load<T: Decodable>(_ filename: String) -> T {
    let data: Data
    
    
    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
    else {
        fatalError("Couldn't find \(filename) in main bundle.")
    }
    
    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
    }
    
    
    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
    }
}
