//
//  FeedViewModel.swift
//  SharingApplication
//
//  Created by Philip Zakharov on 25.09.2023.
//

import Foundation
import FirebaseAuth

final class FeedViewModel {
    private let coordinator: AppCoordinator
    var feedModel: [FeedModel] = []
    
    var feedCount: Int {
        feedModel.count
    }
    
    init(coordinator: AppCoordinator) {
        self.coordinator = coordinator
    }
    
    func fetchTestData() {
        Task {
            do {
                self.feedModel = try await FeedModel.getTestData()
            } catch {
                print("Error fetching test data: \(error)")
            }
        }
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
