//
//  ApiServices.swift
//  Await-SwiftUI
//
//  Created by Navin Rai on 29/05/25.
//

import Foundation

final class ApiServices {
    static func getUserData() async throws -> [UserModel] {
        let urlString = "https://api.github.com/users"
        guard let url = URL(string: urlString) else {
            throw ErrorCase.invalidURL
        }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
            throw ErrorCase.invalidResponse
        }
        do {
            let decoder = JSONDecoder()
            return try decoder.decode([UserModel].self, from: data)
        } catch {
            throw ErrorCase.invalidData
        }
    }
}


