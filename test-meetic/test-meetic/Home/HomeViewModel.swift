//
//  HomeViewModel.swift
//  test-meetic
//
//  Created by Alex Phonesavanh on 16/12/2018.
//  Copyright © 2018 aphones. All rights reserved.
//

protocol HomeScreenDelegate: class {
    func homeScreenDidSelectCharacter(with id: Int)
}

final class HomeViewModel {

    // MARK: - Properties

    private weak var delegate: HomeScreenDelegate?
    private let characterRepository: CharacterRepositoryType
    private var characters: [Character] = [] {
        didSet {
            homeCharacters?(characters.map { HomeCharacter(character: $0) })
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

    var homeCharacters: (([HomeCharacter]) -> Void)?
    var isLoading: ((Bool) -> Void)?

    // MARK: - Inputs

    func viewDidLoad() {
        currentPage = 1
        fetchCharacters(for: currentPage)
    }

    func didSelectCharacter(at index: Int) {
        let characterId = characters[index].id
        delegate?.homeScreenDidSelectCharacter(with: characterId)
    }

    func fetchNextCharacters() {
        guard !isFetchingData && currentPage < numberOfPages else { return }
        currentPage += 1
        fetchCharacters(for: currentPage)
    }

    // MARK: - Private

    private func fetchCharacters(for page: Int) {
        isFetchingData = true
        characterRepository.getCharacters(page: page, completionHandler: { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let charactersPage):
                self.numberOfPages = charactersPage.info.pages
                self.characters.append(contentsOf: charactersPage.characters)
                self.isFetchingData = false
            case .error(let error):
                print("\(error)")
            }
        })
    }
}
