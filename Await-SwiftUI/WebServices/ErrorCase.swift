//
//  ErrorCase.swift
//  Await-SwiftUI
//
//  Created by Navin Rai on 29/05/25.
//

import Foundation

enum ErrorCase: LocalizedError {
    case invalidURL
    case invalidResponse
    case invalidData
    case custom(erro: Error)
    
    var errorDescription: String? {
        switch self {
            case.invalidURL:
                return "Invalid URL"
            case .invalidResponse:
                return "Invalid Response"
            case .invalidData:
                return "Invalid data"
            case . custom(let error):
                return error.localizedDescription
        }
    }
}
