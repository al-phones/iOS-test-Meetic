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
    @IBOutlet private weak var imageView: UIImageView!

    // MARK: - Properties

    var barButtonItemFactory: BarButtonItemFactory!
    var viewModel: ProfileViewModel!

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
        bind(to: viewModel)
        viewModel.viewDidLoad()
    }

    @objc func backButtonItemDidSelect(_ sender: UIBarButtonItem) {
        viewModel.goBack()
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

        viewModel.imageUrl = { [weak self] imageUrl in
            self?.imageView.load(from: imageUrl)
        }
    }

    private func setupNavigationBar() {
        navigationItem.leftBarButtonItem = barButtonItemFactory.makeBackButtonItem(target: self, action: #selector(backButtonItemDidSelect(_:)))
    }
}
