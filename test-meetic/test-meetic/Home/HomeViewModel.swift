//
//  HomeViewModel.swift
//  test-meetic
//
//  Created by Alex Phonesavanh on 16/12/2018.
//  Copyright © 2018 aphones. All rights reserved.
//

final class HomeViewModel {

    // MARK: - Properties

    private let characterRepository: CharacterRepositoryType
    private var characters: [Character] = [] {
        didSet {
            displayableCharacters?(characters)
        }
    }

    // MARK: - Init

    init(characterRepository: CharacterRepositoryType = CharacterRepository()) {
        self.characterRepository = characterRepository
    }

    // MARK: - Outputs

    var displayableCharacters: (([Character]) -> Void)?

    // MARK: - Inputs

    func viewDidLoad() {
        fetchCharacters()
    }

    // MARK: - Private

    private func fetchCharacters() {
        characterRepository.getCharacters(successHandler: { [weak self] characters in
            self?.characters.append(contentsOf: characters)
        })
    }
}
