//
//  SceneDelegate.swift
//  SharingApplication
//
//  Created by Philip Zakharov on 25.09.2023.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    var coordinator: AppCoordinator?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        let navigationController = UINavigationController()

        coordinator = AppCoordinator(navigationController: navigationController)
        setupWindow(with: scene, navigationController: navigationController)
        coordinator?.start()
    }

    public func setupWindow(with scene: UIScene, navigationController: UINavigationController) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windowScene)
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
    }
}
