//
//  HomeCharacterTableViewCell.swift
//  test-meetic
//
//  Created by Alex Phonesavanh on 16/12/2018.
//  Copyright © 2018 aphones. All rights reserved.
//

import UIKit
import SDWebImage

class HomeCharacterTableViewCell: UITableViewCell {

    // MARK: - Outlets

    @IBOutlet private weak var characterImageView: UIImageView! {
        didSet {
            characterImageView.layer.cornerRadius = 6
        }
    }
    @IBOutlet private weak var descriptionView: UIView! {
        didSet {
            descriptionView.layer.cornerRadius = 3
        }
    }
    @IBOutlet private weak var characterNameLabel: UILabel!

    // MARK: - Public

    func configure(with character: HomeCharacter) {
        characterNameLabel.text = character.name
        if let imageUrl = character.imageUrl {
            characterImageView.sd_setImage(with: imageUrl)
        }
    }
}
