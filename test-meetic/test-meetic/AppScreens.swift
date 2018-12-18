//
//  AppScreens.swift
//  test-meetic
//
//  Created by Alex Phonesavanh on 17/12/2018.
//  Copyright © 2018 aphones. All rights reserved.
//

import UIKit

final class AppScreens {

    // MARK: - Properties

    private let appContext: AppContext
    private let storyboard = UIStoryboard(name: "Main", bundle: nil)

    // MARK: - Init

    init(appContext: AppContext) {
        self.appContext = appContext
    }

    // MARK: - Screens

    func createHomeViewController(delegate: HomeScreenDelegate) -> HomeViewController {
        let viewController: HomeViewController = instantiateViewController(with: String(describing: HomeViewController.self))
        viewController.viewModel = HomeViewModel(
            delegate: delegate,
            characterRepository: appContext.profileRepository)
        return viewController
    }

    func createProfileViewController(delegate: ProfileScreenDelegate, profileId: Int) -> ProfileViewController {
        let viewController: ProfileViewController = instantiateViewController(with: String(describing: ProfileViewController.self))
        viewController.barButtonItemFactory = appContext.barButtonItemFactory
        viewController.viewModel = ProfileViewModel(
            delegate: delegate,
            profileId: profileId,
            characterRepository: appContext.profileRepository)
        return viewController
    }

    // MARK: - Utils

    private func instantiateViewController<T: UIViewController>(with identifier: String) -> T {
        guard let viewController = storyboard.instantiateViewController(withIdentifier: identifier) as? T else {
            fatalError("Unable to instantiate the ViewController: \(identifier)")
        }
        return viewController
    }
}
