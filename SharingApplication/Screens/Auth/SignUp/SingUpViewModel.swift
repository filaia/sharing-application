//
//  SingUpViewModel.swift
//  FrameApplication
//
//  Created by Philip Zakharov on 25.09.2023.
//

import Foundation

final class SignUpViewModel {
    
    private var coordinator: AppCoordinator
    
    init(coordinator: AppCoordinator) {
        self.coordinator = coordinator
    }
    
    func signUp(username: String, email: String, password: String) async throws -> Bool {
        do {
            let result = try await AuthService.shared.signUpUser(with: SignUpUserRequest(username: username, email: email, password: password))
            return result
        } catch {
            print("error")
            return false
        }
    }
    
    func goBack() {
        coordinator.popCoordinator()
    }
}
