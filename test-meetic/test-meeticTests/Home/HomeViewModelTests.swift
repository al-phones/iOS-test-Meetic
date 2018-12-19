//
//  HomeViewModelTests.swift
//  test-meeticTests
//
//  Created by Alex Phonesavanh on 19/12/2018.
//  Copyright © 2018 aphones. All rights reserved.
//

import XCTest
@testable import test_meetic

final class HomeViewModelTests: XCTestCase {

    private let homeScreenDelegate = MockHomeScreenDelegate()

    // MARK: - ViewDidLoad

    func testWhenViewDidLoad_ItOutputsHomeCharacters() {
        let characterRepository = createCharacterRespository()
        let viewModel = HomeViewModel(
            delegate: homeScreenDelegate,
            characterRepository: characterRepository)

        let expectation = self.expectation(description: "HomeCharacters block is executed")
        let expectedCharacters = [
            HomeCharacter(name: "Rick Sanchez", imageUrl: URL(string: "/rick.png")),
            HomeCharacter(name: "Morty Smith", imageUrl: URL(string: "/morty.png"))
        ]

        viewModel.homeCharacters = { homeCharacters in
            XCTAssertEqual(expectedCharacters, homeCharacters)
            expectation.fulfill()
        }

        viewModel.viewDidLoad()
        self.waitForExpectations(timeout: 5)
    }

    func testWhenViewDidLoad_ItOutputsLoading() {
        let characterRepository = createCharacterRespository()
        let viewModel = HomeViewModel(
            delegate: homeScreenDelegate,
            characterRepository: characterRepository)

        let expectation = self.expectation(description: "isLoading block is executed")
        expectation.expectedFulfillmentCount = 2
        var expectedIsLoading = true

        viewModel.isLoading = { isLoading in
            XCTAssertEqual(expectedIsLoading, isLoading)
            expectedIsLoading = !expectedIsLoading
            expectation.fulfill()
        }

        viewModel.viewDidLoad()
        self.waitForExpectations(timeout: 5)
    }

    // MARK: - DidSelectCharacter

    func testWhenSelectCharacter_ItCallsHomeScreenDidSelectCharacter() {
        let characterRepository = createCharacterRespository()
        let viewModel = HomeViewModel(
            delegate: homeScreenDelegate,
            characterRepository: characterRepository)
        let expectation = self.expectation(description: "homeCharacters block is executed and did select character")

        viewModel.homeCharacters = { _ in
            viewModel.didSelectCharacter(at: 0)
            XCTAssertEqual(self.homeScreenDelegate.selectedCharacterId, 1)
            expectation.fulfill()
        }

        viewModel.viewDidLoad()

        waitForExpectations(timeout: 5)
    }

    // MARK: - FetchNextCharacters

    func testWhenFetchNextCharacters_ItOutputsHomeCharacters() {
        let characterRepository = createCharacterRespository()
        let viewModel = HomeViewModel(
            delegate: homeScreenDelegate,
            characterRepository: characterRepository)

        let expectation = self.expectation(description: "HomeCharacters block is executed")
        let expectedCharacters = [
            HomeCharacter(name: "Rick Sanchez", imageUrl: URL(string: "/rick.png")),
            HomeCharacter(name: "Morty Smith", imageUrl: URL(string: "/morty.png")),
            HomeCharacter(name: "Summer Smith", imageUrl: URL(string: "/summer.png")),
            HomeCharacter(name: "Beth Smith", imageUrl: URL(string: "/beth.png"))
        ]

        viewModel.viewDidLoad()

        viewModel.homeCharacters = { homeCharacters in
            XCTAssertEqual(expectedCharacters, homeCharacters)
            expectation.fulfill()
        }

        viewModel.fetchNextCharacters()
        self.waitForExpectations(timeout: 5)
    }

    // MARK: - Data

    private func createCharacterRespository() -> CharacterRepositoryType {
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
                                image: "/rick.png"),
                            test_meetic.Character(
                                id: 2,
                                name: "Morty Smith",
                                status: "Alive",
                                species: "Human",
                                origin: test_meetic.Character.Origin(name: "Earth"),
                                gender: "Male",
                                image: "/morty.png")
                ]),
            CharactersPage(info: CharactersPage.Info(pages: 2),
                           characters: [
                            test_meetic.Character(
                                id: 3,
                                name: "Summer Smith",
                                status: "Alive",
                                species: "Human",
                                origin: test_meetic.Character.Origin(name: "Earth (Replacement dimension)"),
                                gender: "Female",
                                image: "/summer.png"),
                            test_meetic.Character(
                                id: 4,
                                name: "Beth Smith",
                                status: "Alive",
                                species: "Human",
                                origin: test_meetic.Character.Origin(name: "Earth (Replacement dimension)"),
                                gender: "Female",
                                image: "/beth.png")
                ])
        ]
        return MockCharacterRepository(charactersPages: charactersPages)
    }
}

// MARK: - Equatable

extension HomeCharacter: Equatable {
    public static func ==(lhs: HomeCharacter, rhs: HomeCharacter) -> Bool {
        return String(describing: lhs) == String(describing: rhs)
    }
}
