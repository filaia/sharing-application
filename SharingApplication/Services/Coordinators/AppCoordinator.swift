//
//  AppCoordinator.swift
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

class AppCoordinator: Coordinator {
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        if AuthService.shared.isUserAuth {
            showFeed()
        } else {
            showSignIn()
        }
    }
    
    func showSignIn() {
        let signInViewContoller = ViewControllerFactory.makeSignInViewController(with: navigationController)
        navigationController.pushViewController(signInViewContoller, animated: false)
    }
    
    func showSignUp() {
        let signUpViewController = ViewControllerFactory.makeSignUpViewController(with: navigationController)
        signUpViewController.modalPresentationStyle = .fullScreen
        navigationController.present(signUpViewController, animated: true)
    }
    
    func showFeed() {
        let feedViewController = ViewControllerFactory.makeFeedViewController(with: navigationController)
        navigationController.pushViewController(feedViewController, animated: true)
    }
    
    func popCoordinator() {
        navigationController.popViewController(animated: true)
    }
}
