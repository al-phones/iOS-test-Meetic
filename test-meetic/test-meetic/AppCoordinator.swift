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
    private var navigationController: UINavigationController!

    init(presenter: UIWindow) {
        self.presenter = presenter
        screens = AppScreens()
    }

    func start() {
        let viewController = screens.createHomeViewController(delegate: self)
        navigationController = UINavigationController(rootViewController: viewController)
        presenter.rootViewController = navigationController
    }

    func navigateToProfile(with id: Int) {
        let viewController = screens.createProfileViewController(profileId: id)
        navigationController.pushViewController(viewController, animated: true)
    }
}

// MARK: - HomeDelegate

extension AppCoordinator: HomeDelegate {
    func didSelectCharacter(id: Int) {
        navigateToProfile(with: id)
    }
}
