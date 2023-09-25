//
//  FeedViewModel.swift
//  SharingApplication
//
//  Created by Philip Zakharov on 25.09.2023.
//

import Foundation

final class FeedViewModel {
    let networking: MockNetworking
    let user: User
    
    init(networking: MockNetworking, user: User) {
        self.networking = networking
        self.user = user
    }
    
    func getEmail() -> String {
        user.email
    }
    
    func fetchUser(completion: @escaping (String) -> ()) {
        networking.getDataFromServer { _ in
            completion(self.user.email)
        }
    }
    
}
