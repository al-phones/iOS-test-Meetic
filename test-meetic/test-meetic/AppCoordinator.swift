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

    func navigateToCharacter(with id: Int) {
        let viewController = screens.createCharacterViewController(delegate: self, characterId: id)
        navigationController.pushViewController(viewController, animated: true)
    }
}

// MARK: - HomeScreenDelegate

extension AppCoordinator: HomeScreenDelegate {
    func homeScreenDidSelectCharacter(with id: Int) {
        navigateToCharacter(with: id)
    }
}

// MARK: - CharacterScreenDelegate

extension AppCoordinator: CharacterScreenDelegate {
    func characterScreenDidGoBack() {
        navigationController.popViewController(animated: true)
    }
}
