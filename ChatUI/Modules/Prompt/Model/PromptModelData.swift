//
//  PromptData.swift
//  ChatUI
//
//  Created by Nishant sethi on 30/01/2024.
//

import Foundation

class PromptModelData: ObservableObject {
    @Published var prompts: [Prompt] = []
    @Published var categories: [String: [Prompt]] = [:]

    var features: [Prompt] {
        prompts.filter { $0.isFeatured }
    }

    init() {
        loadPrompts()
        updateCategories()
    }

    private func loadPrompts() {
        prompts = load("prompts.json")
    }

    func updateCategories(filteredCategories: [String]? = nil) {
        if let filteredCategories = filteredCategories {
            // Filter prompts whose category is in the filteredCategories array
            let filteredPrompts = prompts.filter { prompt in
                filteredCategories.contains(prompt.category)
            }
            // Group the filtered prompts by category
            self.categories = Dictionary(grouping: filteredPrompts, by: { $0.category })
        } else {
            // Group all prompts by category if no filter is provided
            self.categories = Dictionary(grouping: prompts, by: { $0.category })
        }
    }

}

func load<T: Decodable>(_ filename: String) -> T {
    guard let file = Bundle.main.url(forResource: filename, withExtension: nil) else {
        fatalError("Couldn't find \(filename) in main bundle.")
    }

    do {
        let data = try Data(contentsOf: file)
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't load or parse \(filename): \(error)")
    }
}
