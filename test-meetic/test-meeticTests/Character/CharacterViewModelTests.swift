//
//  CharacterViewModelTests.swift
//  test-meeticTests
//
//  Created by Alex Phonesavanh on 19/12/2018.
//  Copyright © 2018 aphones. All rights reserved.
//

import XCTest
@testable import test_meetic

final class CharacterViewModelTests: XCTestCase {

    private let characterScreenDelegate = MockCharacterScreenDelegate()

    // MARK: - ViewDidLoad

    func testWhenViewDidLoad_itOutputsName() {
        let characterRepository = createCharacterRepository()
        let viewModel = CharacterViewModel(
            delegate: characterScreenDelegate,
            characterId: 1,
            characterRepository: characterRepository)
        let expecation = self.expectation(description: "name block is executed")

        viewModel.name = { name in
            XCTAssertEqual(name, "Rick Sanchez")
            expecation.fulfill()
        }

        viewModel.viewDidLoad()
        waitForExpectations(timeout: 5)
    }

    func testWhenViewDidLoad_itOutputsGender() {
        let characterRepository = createCharacterRepository()
        let viewModel = CharacterViewModel(
            delegate: characterScreenDelegate,
            characterId: 1,
            characterRepository: characterRepository)
        let expecation = self.expectation(description: "gender block is executed")

        viewModel.gender = { gender in
            XCTAssertEqual(gender, "Male")
            expecation.fulfill()
        }

        viewModel.viewDidLoad()
        waitForExpectations(timeout: 5)
    }

    func testWhenViewDidLoad_itOutputsDescription() {
        let characterRepository = createCharacterRepository()
        let viewModel = CharacterViewModel(
            delegate: characterScreenDelegate,
            characterId: 1,
            characterRepository: characterRepository)
        let expecation = self.expectation(description: "description block is executed")

        viewModel.description = { description in
            XCTAssertEqual(description, "Alive - Human - Earth")
            expecation.fulfill()
        }

        viewModel.viewDidLoad()
        waitForExpectations(timeout: 5)
    }

    func testWhenViewDidLoad_itOutputsImageUrl() {
        let characterRepository = createCharacterRepository()
        let viewModel = CharacterViewModel(
            delegate: characterScreenDelegate,
            characterId: 1,
            characterRepository: characterRepository)
        let expecation = self.expectation(description: "imageUrl block is executed")

        viewModel.imageUrl = { imageUrl in
            XCTAssertEqual(imageUrl, URL(string: "/rick.png"))
            expecation.fulfill()
        }

        viewModel.viewDidLoad()
        waitForExpectations(timeout: 5)
    }

    // MARK: - GoBack

    func testWhenGoBack_ItCallsCharacterScreenDidGoBack() {
        let characterRepository = createCharacterRepository()
        let viewModel = CharacterViewModel(
            delegate: characterScreenDelegate,
            characterId: 1,
            characterRepository: characterRepository)

        viewModel.goBack()
        XCTAssertEqual(characterScreenDelegate.didGoBack, true)
    }

    // MARK: - Data

    private func createCharacterRepository() -> CharacterRepositoryType {
        let charactersPages = [
            CharactersPage(info: CharactersPage.Info(pages: 2),
                           characters: [
                            test_meetic.Character(
                                id: 1,
                                name: "Rick Sanchez",
                                status: "Alive",
                                species: "Human",
                                origin: test_meetic.Character.Origin(name: "Earth"),
                                gender: "Male",
                                image: "/rick.png")
                ])
        ]
        return MockCharacterRepository(charactersPages: charactersPages)
    }
}
