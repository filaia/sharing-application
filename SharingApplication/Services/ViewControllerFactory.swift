//
//  ViewControllerFactory.swift
//  SharingApplication
//
//  Created by Philip Zakharov on 25.09.2023.
//

import Foundation
import UIKit

struct ViewControllerFactory {
    public static func makeSignInViewController(with navigationController: UINavigationController) -> SignInViewController {
        let coordinator = AppCoordinator(navigationController: navigationController)
        let viewModel = SignInViewModel(coordinator: coordinator)
        let viewController = SignInViewController(signInViewModel: viewModel)
        return viewController
    }
    
    public static func makeSignUpViewController(with navigationController: UINavigationController) -> SignUpViewController {
        let coordinator = AppCoordinator(navigationController: navigationController)
        let viewModel = SignUpViewModel(coordinator: coordinator)
        let viewController = SignUpViewController(signUpViewModel: viewModel)
        return viewController
    }
    
    public static func makeFeedViewController(with navigationController: UINavigationController) -> FeedViewController {
        let coordinator = AppCoordinator(navigationController: navigationController)
        let viewModel = FeedViewModel(coordinator: coordinator)
        let viewController = FeedViewController(feedViewModel: viewModel)
        return viewController
    }
}
