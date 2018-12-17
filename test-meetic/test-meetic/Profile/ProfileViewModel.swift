//
//  ProfileViewModel.swift
//  test-meetic
//
//  Created by Alex Phonesavanh on 17/12/2018.
//  Copyright © 2018 aphones. All rights reserved.
//

final class ProfileViewModel {

    // MARK: - Properties

    private let profileId: Int
    private let characterRepository: CharacterRepositoryType

    // MARK: - Init

    init(profileId: Int,
         characterRepository: CharacterRepositoryType = CharacterRepository()) {
        self.profileId = profileId
        self.characterRepository = characterRepository
    }

    // MARK: - Outputs

    var name: ((String) -> Void)?
    var gender: ((String) -> Void)?
    var description: ((String) -> Void)?

    // MARK: - Inputs

    func viewDidLoad() {
        fetchCharacter(with: profileId)
    }

    // MARK: - Private

    private func fetchCharacter(with id: Int) {
        characterRepository.getCharacter(with: id, successHandler: { [weak self] character in
            self?.name?(character.name)
            self?.gender?(character.gender)
            self?.description?("\(character.status) - \(character.species) - \(character.origin.name)")
        })
    }
}
