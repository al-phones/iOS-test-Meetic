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
    private var isFetchingData: Bool = false {
        didSet {
            isLoading?(isFetchingData)
        }
    }
    private var numberOfPages = 0
    private var currentPage = 0

    // MARK: - Init

    init(delegate: HomeScreenDelegate,
         characterRepository: CharacterRepositoryType) {
        self.delegate = delegate
        self.characterRepository = characterRepository
    }

    // MARK: - Outputs

    var displayableCharacters: (([Character]) -> Void)?
    var isLoading: ((Bool) -> Void)?

    // MARK: - Inputs

    func viewDidLoad() {
        currentPage = 1
        fetchCharacters(for: currentPage)
    }

    func didSelectProfile(at index: Int) {
        let characterId = characters[index].id
        delegate?.didSelectCharacter(id: characterId)
    }

    func fetchNextProfiles() {
        guard !isFetchingData && currentPage < numberOfPages else { return }
        currentPage += 1
        fetchCharacters(for: currentPage)
    }

    // MARK: - Private

    private func fetchCharacters(for page: Int) {
        print("fetch page \(page)")
        isFetchingData = true
        characterRepository.getCharacters(page: page, successHandler: { [weak self] charactersPage in
            guard let self = self else { return }
            self.numberOfPages = charactersPage.info.pages
            self.characters.append(contentsOf: charactersPage.characters)
            self.isFetchingData = false
        })
    }
}
