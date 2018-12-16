//
//  CharactersPageInfo.swift
//  test-meetic
//
//  Created by Alex Phonesavanh on 16/12/2018.
//  Copyright © 2018 aphones. All rights reserved.
//

struct CharacterPageInfo: Decodable {
    let count: Int
    let pages: Int
    let next: String
    let prev: String
}
