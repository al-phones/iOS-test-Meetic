//
//  Result.swift
//  test-meetic
//
//  Created by Alex Phonesavanh on 19/12/2018.
//  Copyright © 2018 aphones. All rights reserved.
//

enum Result<T> {
    case success(T)
    case error(Error)
}
