//
//  FeedViewModel.swift
//  SharingApplication
//
//  Created by Philip Zakharov on 25.09.2023.
//

import Foundation
import FirebaseAuth

final class FeedViewModel {
    let coordinator: AppCoordinator
    
    init(coordinator: AppCoordinator) {
        self.coordinator = coordinator
    }
    
    func logout() {
        do {
            try Auth.auth().signOut()
        } catch let error {
            print(error)
        }
        coordinator.showSignIn()
    }
}
