//
//  CharactersPage.swift
//  test-meetic
//
//  Created by Alex Phonesavanh on 16/12/2018.
//  Copyright © 2018 aphones. All rights reserved.
//

struct CharactersPage: Decodable {
    let info: CharacterPageInfo
    let characters: [Character]

    enum CodingKeys: String, CodingKey {
        case info
        case characters = "results"
    }
}
