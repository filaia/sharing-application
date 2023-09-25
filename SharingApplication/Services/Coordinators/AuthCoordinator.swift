//
//  AuthCoordinator.swift
//  SharingApplication
//
//  Created by Philip Zakharov on 25.09.2023.
//

import Foundation
import UIKit

protocol Coordinator {
    var childCoordinators: [Coordinator] { get set }
    var navigationController: UINavigationController { get set }
    
    func start()
}

class AuthCoordinator: Coordinator {
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let loginViewController = ViewControllerFactory.makeLoginViewController(with: navigationController)
        navigationController.pushViewController(loginViewController, animated: false)
    }
    
    func showSignUp() {
        let signUpViewController = ViewControllerFactory.makeSignUpViewController()
        navigationController.pushViewController(signUpViewController, animated: true)
    }
    
    func showFeed(with user: User) {
        let feedViewController = ViewControllerFactory.makeFeedViewController(with: user)
        navigationController.pushViewController(feedViewController, animated: true)
    }
}
