//
//  AppScreensTests.swift
//  test-meeticTests
//
//  Created by Alex Phonesavanh on 19/12/2018.
//  Copyright © 2018 aphones. All rights reserved.
//

import XCTest
@testable import test_meetic

final class AppScreensTests: XCTestCase {

    // MARK: - Home Screen

    func testCreateHomeScreen() {
        let appContext = AppContext(characterRepository: MockCharacterRepository(charactersPages: []),
                                    barButtonItemFactory: BarButtonItemFactory())
        let appScreens = AppScreens(appContext: appContext)
        let delegate = MockHomeScreenDelegate()
        let viewController = appScreens.createHomeViewController(delegate: delegate)

        XCTAssertNotNil(viewController)
    }

    // MARK: - Character Screen

    func testCreateCharacterScreen() {
        let appContext = AppContext(characterRepository: MockCharacterRepository(charactersPages: []),
                                    barButtonItemFactory: BarButtonItemFactory())
        let appScreens = AppScreens(appContext: appContext)
        let delegate = MockCharacterScreenDelegate()
        let viewController = appScreens.createCharacterViewController(delegate: delegate, characterId: 1)

        XCTAssertNotNil(viewController)
    }
}
