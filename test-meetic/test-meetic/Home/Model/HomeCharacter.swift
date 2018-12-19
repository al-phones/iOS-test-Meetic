//
//  HomeCharacter.swift
//  test-meetic
//
//  Created by Alex Phonesavanh on 19/12/2018.
//  Copyright © 2018 aphones. All rights reserved.
//

import Foundation

struct HomeCharacter {
    let name: String
    let imageUrl: URL?

    init(name: String, imageUrl: URL?) {
        self.name = name
        self.imageUrl = imageUrl
    }

    init(character: Character) {
        self.init(name: character.name, imageUrl: URL(string: character.image))
    }
}
