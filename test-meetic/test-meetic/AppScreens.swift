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

    func createHomeViewController(delegate: HomeScreenDelegate) -> UIViewController {
        let viewController: HomeViewController = storyboard.instantiateViewController(withIdentifier: String(describing: HomeViewController.self)) as! HomeViewController
        viewController.viewModel = HomeViewModel(
            delegate: delegate,
            characterRepository: appContext.characterRepository)
        return viewController
    }

    func createCharacterViewController(delegate: CharacterScreenDelegate, characterId: Int) -> UIViewController {
        let viewController: CharacterViewController = storyboard.instantiateViewController(withIdentifier: String(describing: CharacterViewController.self)) as! CharacterViewController
        viewController.barButtonItemFactory = appContext.barButtonItemFactory
        viewController.viewModel = CharacterViewModel(
            delegate: delegate,
            characterId: characterId,
            characterRepository: appContext.characterRepository)
        return viewController
    }
}
