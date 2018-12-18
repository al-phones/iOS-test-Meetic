//
//  ProfileViewModel.swift
//  test-meetic
//
//  Created by Alex Phonesavanh on 17/12/2018.
//  Copyright © 2018 aphones. All rights reserved.
//

import Foundation

protocol ProfileScreenDelegate: class {
    func didGoBack()
}

final class ProfileViewModel {

    // MARK: - Properties

    weak var delegate: ProfileScreenDelegate?
    private let profileId: Int
    private let characterRepository: CharacterRepositoryType

    // MARK: - Init

    init(delegate: ProfileScreenDelegate,
         profileId: Int,
         characterRepository: CharacterRepositoryType) {
        self.delegate = delegate
        self.profileId = profileId
        self.characterRepository = characterRepository
    }

    // MARK: - Outputs

    var name: ((String) -> Void)?
    var gender: ((String) -> Void)?
    var description: ((String) -> Void)?
    var imageUrl: ((URL) -> Void)?

    // MARK: - Inputs

    func viewDidLoad() {
        fetchCharacter(with: profileId)
    }

    func goBack() {
        delegate?.didGoBack()
    }

    // MARK: - Private

    private func fetchCharacter(with id: Int) {
        characterRepository.getCharacter(with: id, successHandler: { [weak self] character in
            self?.name?(character.name)
            self?.gender?(character.gender)
            self?.description?("\(character.status) - \(character.species) - \(character.origin.name)")
            if let imageUrl = URL(string: character.image) {
                self?.imageUrl?(imageUrl)
            }
        })
    }
}
