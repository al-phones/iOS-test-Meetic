//
//  Character.swift
//  test-meetic
//
//  Created by Alex Phonesavanh on 16/12/2018.
//  Copyright © 2018 aphones. All rights reserved.
//

struct Character: Decodable {
    let id: Int
    let name: String
    let status: String
    let species: String
    let origin: Origin
    let gender: String
    let image: String

    struct Origin: Decodable {
        let name: String
    }
}
