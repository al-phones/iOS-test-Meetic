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
        let viewController = screens.createHomeViewController()
        navigationController = UINavigationController(rootViewController: viewController)
        presenter.rootViewController = navigationController
    }
}
