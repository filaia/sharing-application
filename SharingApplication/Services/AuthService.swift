//
//  AuthService.swift
//  SharingApplication
//
//  Created by Philip Zakharov on 25.09.2023.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

final class AuthService {
    static let shared = AuthService()
    
    public var isUserAuth: Bool {
        Auth.auth().currentUser != nil
    }
    
    private init() { }
    
    public func signUpUser(with user: SignUpUserRequest) async throws -> Bool {

//        guard !user.username.isEmpty else {
//            throw SignUpError.invalidUsername
//        }
//
//        guard !user.email.isEmpty else {
//            throw SignUpError.invalidEmail
//        }
//
//        guard !user.password.isEmpty else {
//            throw SignUpError.invalidPassword
//        }

        let resultUser = try await Auth.auth().createUser(withEmail: user.email, password: user.password)

        let db = Firestore.firestore()

        try await db.collection("Users")
            .document(resultUser.user.uid)
            .setData([
                "username": user.username,
                "email": user.email,
            ])
        
        return true
    }
    
    public func singInUser(with user: SignInUserRequest) async throws -> Bool {
        let email = user.email
        let password = user.password
        
        do {
            try await Auth.auth().signIn(withEmail: email, password: password)
            return true
        } catch {
            throw error
        }
    }
}
