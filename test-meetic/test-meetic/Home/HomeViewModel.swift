//
//  HomeViewModel.swift
//  test-meetic
//
//  Created by Alex Phonesavanh on 16/12/2018.
//  Copyright © 2018 aphones. All rights reserved.
//

protocol HomeScreenDelegate: class {
    func didSelectCharacter(id: Int)
}

final class HomeViewModel {

    // MARK: - Properties

    private weak var delegate: HomeScreenDelegate?
    private let characterRepository: CharacterRepositoryType
    private var characters: [Character] = [] {
        didSet {
            displayableCharacters?(characters)
        }
    }

    // MARK: - Init

    init(delegate: HomeScreenDelegate,
         characterRepository: CharacterRepositoryType) {
        self.delegate = delegate
        self.characterRepository = characterRepository
    }

    // MARK: - Outputs

    var displayableCharacters: (([Character]) -> Void)?

    // MARK: - Inputs

    func viewDidLoad() {
        fetchCharacters()
    }

    func didSelectProfile(at index: Int) {
        let characterId = characters[index].id
        delegate?.didSelectCharacter(id: characterId)
    }

    // MARK: - Private

    private func fetchCharacters() {
        characterRepository.getCharacters(successHandler: { [weak self] characters in
            self?.characters.append(contentsOf: characters)
        })
    }
}
