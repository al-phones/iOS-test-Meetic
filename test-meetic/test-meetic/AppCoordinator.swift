//
//  AppCoordinator.swift
//  test-meetic
//
//  Created by Alex Phonesavanh on 17/12/2018.
//  Copyright © 2018 aphones. All rights reserved.
//

import UIKit

final class AppCoordinator {

    private let presenter: UIWindow
    private let screens: AppScreens
    private let appContext: AppContext
    private var navigationController: UINavigationController!

    init(presenter: UIWindow, appContext: AppContext) {
        self.presenter = presenter
        self.appContext = appContext
        screens = AppScreens(appContext: appContext)
    }

    func start() {
        let viewController = screens.createHomeViewController(delegate: self)
        navigationController = UINavigationController(rootViewController: viewController)
        presenter.rootViewController = navigationController
    }

    func navigateToProfile(with id: Int) {
        let viewController = screens.createProfileViewController(delegate: self, profileId: id)
        navigationController.pushViewController(viewController, animated: true)
    }
}

// MARK: - HomeScreenDelegate

extension AppCoordinator: HomeScreenDelegate {
    func didSelectCharacter(id: Int) {
        navigateToProfile(with: id)
    }
}

// MARK: - ProfileScreenDelegate

extension AppCoordinator: ProfileScreenDelegate {
    func didGoBack() {
        navigationController.dismiss(animated: true)
    }
}
