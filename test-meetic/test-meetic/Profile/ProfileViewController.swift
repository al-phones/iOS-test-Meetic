//
//  ProfileViewController.swift
//  test-meetic
//
//  Created by Alex Phonesavanh on 17/12/2018.
//  Copyright © 2018 aphones. All rights reserved.
//

import UIKit

final class ProfileViewController: UIViewController {

    // MARK: - Outlets

    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var genderLabel: UILabel!
    @IBOutlet private weak var descriptionLabel: UILabel!

    // MARK: - Properties

    var viewModel: ProfileViewModel!

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        bind(to: viewModel)
        viewModel.viewDidLoad()
    }

    // MARK: - Private

    private func bind(to viewModel: ProfileViewModel) {
        viewModel.name = { [weak self] name in
            self?.nameLabel.text = name
        }

        viewModel.gender = { [weak self] gender in
            self?.genderLabel.text = gender
        }

        viewModel.description = { [weak self] description in
            self?.descriptionLabel.text = description
        }
    }
}
