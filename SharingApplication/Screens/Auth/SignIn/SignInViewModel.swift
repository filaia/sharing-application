//
//  SignInViewModel.swift
//  SharingApplication
//
//  Created by Philip Zakharov on 25.09.2023.
//

import Foundation

final class SignInViewModel {
    private let coordinator: AppCoordinator
    
    init(coordinator: AppCoordinator) {
        self.coordinator = coordinator
    }

    func signIn(user: SignInUserRequest) async throws -> Bool {
        do {
            return try await AuthService.shared.singInUser(with: SignInUserRequest(email: user.email, password: user.password))
        } catch {
            throw error
        }
    }
    
    func goToSignUp() {
        coordinator.showSignUp()
    }
    
    func goToFeed() {
        coordinator.showFeed()
    }
}
