//
//  AppContext.swift
//  test-meetic
//
//  Created by Alex Phonesavanh on 18/12/2018.
//  Copyright © 2018 aphones. All rights reserved.
//

import Foundation

final class AppContext {

    // MARK: - Properties

    let profileRepository: CharacterRepositoryType
    let barButtonItemFactory: BarButtonItemFactory

    // MARK: - Init

    init(profileRepository: CharacterRepositoryType,
         barButtonItemFactory: BarButtonItemFactory) {
        self.profileRepository = profileRepository
        self.barButtonItemFactory = barButtonItemFactory
    }
}
