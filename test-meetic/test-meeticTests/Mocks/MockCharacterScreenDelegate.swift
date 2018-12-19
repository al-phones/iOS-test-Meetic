//
//  MockCharacterScreenDelegate.swift
//  test-meeticTests
//
//  Created by Alex Phonesavanh on 19/12/2018.
//  Copyright © 2018 aphones. All rights reserved.
//

@testable import test_meetic

final class MockCharacterScreenDelegate: CharacterScreenDelegate {
    var didGoBack = false

    func characterScreenDidGoBack() {
        didGoBack = true
    }
}
