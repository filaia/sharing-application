//
//  LoginViewModel.swift
//  SharingApplication
//
//  Created by Philip Zakharov on 25.09.2023.
//

import Foundation

final class LoginViewModel {
    private let coordinator: AuthCoordinator
    
    init(coordinator: AuthCoordinator) {
        self.coordinator = coordinator
    }
    
    func goToSignUp() {
        coordinator.showSignUp()
    }
    
    func goToFeed(with user: User) {
        coordinator.showFeed(with: user)
    }
}
