//
//  Networking.swift
//  SharingApplication
//
//  Created by Philip Zakharov on 25.09.2023.
//

import Foundation

class MockNetworking {
    func getDataFromServer(completion: @escaping (String) -> Void) {
        completion("42")
    }
}
