//
//  ViewControllerFactory.swift
//  SharingApplication
//
//  Created by Philip Zakharov on 25.09.2023.
//

import Foundation
import UIKit

struct ViewControllerFactory {
    public static func makeLoginViewController(with navigationController: UINavigationController) -> LoginViewController {
        let coordinator = AuthCoordinator(navigationController: navigationController)
        let viewModel = LoginViewModel(coordinator: coordinator)
        let viewController = LoginViewController(loginViewModel: viewModel)
        return viewController
    }
    
    public static func makeSignUpViewController() -> SignUpViewController {
        let viewModel = SignUpViewModel()
        let viewController = SignUpViewController(signUpViewModel: viewModel)
        return viewController
    }
    
    public static func makeFeedViewController(with user: User) -> FeedViewController {
        let networking = MockNetworking()
        let viewModel = FeedViewModel(networking: networking, user: user)
        let viewController = FeedViewController(feedViewModel: viewModel)
        return viewController
    }
}
