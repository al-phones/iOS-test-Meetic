//
//  HomeCharacterTableViewCell.swift
//  test-meetic
//
//  Created by Alex Phonesavanh on 16/12/2018.
//  Copyright © 2018 aphones. All rights reserved.
//

import UIKit

class HomeCharacterTableViewCell: UITableViewCell {

    // MARK: - Outlets

    @IBOutlet private weak var characterImageView: UIImageView! {
        didSet {
            characterImageView.layer.cornerRadius = 3
        }
    }
    @IBOutlet private weak var descriptionView: UIView! {
        didSet {
            descriptionView.layer.cornerRadius = 3
        }
    }
    @IBOutlet private weak var characterNameLabel: UILabel!

    // MARK: - Lifecycle

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    // MARK: - Public

    func configure(with character: Character) {
        characterNameLabel.text = character.name
    }
    
}
