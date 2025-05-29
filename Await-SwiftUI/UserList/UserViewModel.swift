//
//  UserViewModel.swift
//  Await-SwiftUI
//
//  Created by Navin Rai on 29/05/25.
//

import Foundation

@MainActor

final class UserViewModel: ObservableObject {
    @Published var users: [UserModel]?
    @Published var userError: ErrorCase?
    @Published var showAlert = false
    @Published var isLoading = false
    
    func getUser() async {
        isLoading = true
        do {
            self.users = try await ApiServices.getUserData()
            self.isLoading = false
        } catch(let error) {
            userError = ErrorCase.custom(erro: error)
            showAlert = true
            isLoading = false
        }
    }
}
