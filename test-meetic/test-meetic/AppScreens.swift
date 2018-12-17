//
//  AppScreens.swift
//  test-meetic
//
//  Created by Alex Phonesavanh on 17/12/2018.
//  Copyright © 2018 aphones. All rights reserved.
//

import UIKit

final class AppScreens {

    private let storyboard = UIStoryboard(name: "Main", bundle: nil)

    func createHomeViewController() -> HomeViewController {
        let viewController: HomeViewController = instantiateViewController(with: String(describing: HomeViewController.self))
        viewController.viewModel = HomeViewModel()
        return viewController
    }

    func createProfileViewController(profileId: Int) -> ProfileViewController {
        let viewController: ProfileViewController = instantiateViewController(with: String(describing: ProfileViewController.self))
        viewController.viewModel = ProfileViewModel(profileId: profileId)
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
