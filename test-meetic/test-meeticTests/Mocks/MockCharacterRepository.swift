//
//  MockCharacterRepository.swift
//  test-meeticTests
//
//  Created by Alex Phonesavanh on 19/12/2018.
//  Copyright © 2018 aphones. All rights reserved.
//

@testable import test_meetic

final class MockCharacterRepository: CharacterRepositoryType {

    private let charactersPages: [CharactersPage]

    init(charactersPages: [CharactersPage]) {
        self.charactersPages = charactersPages
    }

    func getCharacters(page: Int, successHandler: @escaping (CharactersPage) -> Void) {
        if page <= charactersPages.count {
            successHandler(charactersPages[page - 1])
        }
    }

    func getCharacter(with id: Int, successHandler: @escaping (test_meetic.Character) -> Void) {
        charactersPages.forEach { page in
            if let character = page.characters.first(where: { $0.id == id }) {
                successHandler(character)
                return
            }
        }
    }
}
