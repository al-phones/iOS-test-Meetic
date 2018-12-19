//
//  CharactersPage.swift
//  test-meetic
//
//  Created by Alex Phonesavanh on 16/12/2018.
//  Copyright © 2018 aphones. All rights reserved.
//

struct CharactersPage: Decodable {
    let info: Info
    let characters: [Character]

    struct Info: Decodable {
        let pages: Int
    }

    enum CodingKeys: String, CodingKey {
        case info
        case characters = "results"
    }
}
