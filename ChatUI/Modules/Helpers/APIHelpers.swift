//
//  APIHelpers.swift
//  ChatUI
//
//  Created by Nishant sethi on 19/03/2024.
//

import Foundation

enum NetworkError: Error {
    case invalidURL
    case noData
}

struct APIUtils {
    struct APIConstants {
        static let baseURL = "https://calm-coast-87343-200918e427ac.herokuapp.com"
        static let setAPIKey = "\(baseURL)/set-api-key"
        static let askGPT = "\(baseURL)/ask-gpt4"
        static let getTitle = "\(baseURL)/get-context"
    }
    static func postRequest(urlString: String, requestBody: [String: Any]) async -> Result<String, Error> {
        guard let url = URL(string: urlString) else {
            return .failure(NetworkError.invalidURL)
        }
        
        do {
            let jsonData = try JSONSerialization.data(withJSONObject: requestBody)
            var request = URLRequest(url: url)
            request.httpMethod = "POST"
            request.httpBody = jsonData
            request.addValue("application/json", forHTTPHeaderField: "Content-Type")
            
            let (data, _) = try await URLSession.shared.data(for: request)
            if let responseMessage = String(data: data, encoding: .utf8) {
                return .success(responseMessage)
            } else {
                return .failure(NetworkError.noData)
            }
        } catch {
            return .failure(error)
        }
    }
    
}
