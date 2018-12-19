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
            characterRepository: appContext.characterRepository)
        return viewController
    }

    func createCharacterViewController(delegate: CharacterScreenDelegate, characterId: Int) -> CharacterViewController {
        let viewController: CharacterViewController = instantiateViewController(with: String(describing: CharacterViewController.self))
        viewController.barButtonItemFactory = appContext.barButtonItemFactory
        viewController.viewModel = CharacterViewModel(
            delegate: delegate,
            characterId: characterId,
            characterRepository: appContext.characterRepository)
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
